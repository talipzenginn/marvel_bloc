import 'package:flutter/material.dart';
import '../../core/extension/context_extensions.dart';
import '../constants/app_constants.dart';

class CustomFutureBuilder<T> extends StatelessWidget {
  final Future<T>? future;
  final Widget Function(T data) onSuccess;
  final Widget? notFoundWidget;
  final Widget? onError;
  final Widget? loading;
  const CustomFutureBuilder(
      {Key? key,
      required this.future,
      required this.onSuccess,
      this.notFoundWidget,
      this.onError,
      this.loading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: future,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return loading ??
                const Center(
                  child: CircularProgressIndicator(),
                );
          case ConnectionState.active:
            return loading ??
                const Center(
                  child: CircularProgressIndicator(),
                );
          case ConnectionState.done:
            if (snapshot.hasData && snapshot.data != null) {
              return onSuccess(snapshot.data);
            } else {
              return notFoundWidget ??
                  Center(
                    child: Text(
                      AppConstants.noConnectionText,
                      style: context.textTheme.subtitle1,
                    ),
                  );
            }
          default:
            return onError ??
                Center(
                  child: Text(
                    AppConstants.errorText,
                    style: context.textTheme.subtitle1,
                  ),
                );
        }
      },
    );
  }
}
