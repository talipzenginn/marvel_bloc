import 'package:flutter/material.dart';

ButtonStyle buttonStyle(BuildContext context) {
  return ButtonStyle(
    elevation: MaterialStateProperty.all<double>(5),
    backgroundColor:
        MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.primary),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
    ),
  );
}
