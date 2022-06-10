import 'dart:async';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';

class RetryInterceptor extends Interceptor {
  Dio dio;
  RetryInterceptor({required this.dio});
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    StreamSubscription? subscription;
    if (_shouldRetry(err)) {
      RequestOptions requestOptions = err.requestOptions;
      Response<dynamic>? response;
      subscription = Connectivity().onConnectivityChanged.listen(
        (ConnectivityResult result) async {
          subscription!.cancel();

          if (result != ConnectivityResult.none) {
            try {
              response = await dio.request(
                requestOptions.path,
                cancelToken: requestOptions.cancelToken,
                data: requestOptions.data,
                onReceiveProgress: requestOptions.onReceiveProgress,
                onSendProgress: requestOptions.onSendProgress,
                queryParameters: requestOptions.queryParameters,
                options: Options(
                  method: requestOptions.method,
                  sendTimeout: requestOptions.sendTimeout,
                  receiveTimeout: requestOptions.receiveTimeout,
                  extra: requestOptions.extra,
                  headers: requestOptions.headers,
                  responseType: requestOptions.responseType,
                  contentType: requestOptions.contentType,
                  validateStatus: requestOptions.validateStatus,
                  receiveDataWhenStatusError:
                      requestOptions.receiveDataWhenStatusError,
                  followRedirects: requestOptions.followRedirects,
                  maxRedirects: requestOptions.maxRedirects,
                  requestEncoder: requestOptions.requestEncoder,
                  responseDecoder: requestOptions.responseDecoder,
                  listFormat: requestOptions.listFormat,
                ),
              );
              if (response != null) {
                handler.resolve(response!);
              } else {
                handler.next(err);
              }
            } on DioError catch (e) {
              handler.next(e);
              rethrow;
            } catch (e) {
              rethrow;
            }
          }
        },
      );
    } else {
      handler.next(err);
    }
  }

  bool _shouldRetry(DioError err) {
    return err.type == DioErrorType.other &&
        err.error != null &&
        err.error is SocketException;
  }
}
