import 'dart:convert';
import 'dart:math';

class CommonUtils {

  /// generate a secure random string
  static String getRandomString(int len) {
    var random = Random.secure();
    var values = List<int>.generate(len, (i) => random.nextInt(255));
    return base64UrlEncode(values);
  }




}