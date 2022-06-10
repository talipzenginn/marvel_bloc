import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../../../core/init/network/retry_interceptor.dart';
import '../../constants/app_constants.dart';

class NetworkManager {
  static NetworkManager? _instance;
  static NetworkManager? get instance {
    _instance ??= NetworkManager._init();
    return _instance;
  }

  NetworkManager._init() {
    final baseOptions = BaseOptions(
      baseUrl: AppConstants.baseUrl,
    );
    _dio = Dio(baseOptions);

    _dio!.interceptors.clear();
    _dio!.interceptors.add(PrettyDioLogger());
    _dio!.interceptors.add(RetryInterceptor(dio: _dio!));
    _dio!.interceptors.add(InterceptorsWrapper(
      onError: (e, handler) {
        handler.next(e);
      },
      onRequest: (requestOptions, handler) {
        handler.next(requestOptions);
      },
      onResponse: (response, handler) {
        handler.resolve(response);
      },
    ));
  }

  Dio? _dio;

  Future get(String path, model) async {
    final response = await _dio!.get(path);
    switch (response.statusCode) {
      case 200:
        final responseBody = response.data;
        if (responseBody is List) {
          return responseBody.map((e) => model.fromJson(e)).toList();
        } else if (responseBody is Map<String, dynamic>) {
          return model(responseBody);
        }
        return responseBody;
    }
  }
}
