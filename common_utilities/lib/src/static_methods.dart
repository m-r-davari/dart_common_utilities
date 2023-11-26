import 'dart:convert';
import 'dart:math';

/// generate a secure random string
String getRandomString(int len) {
  var random = Random.secure();
  var values = List<int>.generate(len, (i) => random.nextInt(255));
  return base64UrlEncode(values);
}
