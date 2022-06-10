import 'dart:convert';
import 'package:crypto/crypto.dart';

extension HashingExtension on String {
  static String generateMd5(String input) {
    return md5.convert(utf8.encode(input)).toString();
  }
}
