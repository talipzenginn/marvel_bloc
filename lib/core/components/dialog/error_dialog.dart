import 'package:flutter/material.dart';
import '../../../core/constants/app_constants.dart';

class ErrorDialog extends StatelessWidget {
  final String errorMessage;
  const ErrorDialog({Key? key, required this.errorMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: AlertDialog(
        title: const Text(AppConstants.errorTitle),
        content: Text(errorMessage),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(AppConstants.okButtonText),
          )
        ],
      ),
    );
  }
}

extension ErrorExtension on ErrorDialog {
  Future show(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return this;
      },
    );
  }
}
