import 'dart:math';
import 'package:intl/intl.dart';
import 'dart:convert' show base64, base64UrlEncode, utf8;

class CommonStringUtils {
  static final String _exceptionTag = 'Exception on StringUtils : ';
  static final CommonStringUtils stringUtils = CommonStringUtils._();
  String _mainStr = '';

  CommonStringUtils._();

  /// Set a string value to [_mainStr] as the variable that should process.
  void construct(String mainStr) {
    this._mainStr = mainStr;
  }

  /// make a sub-string of given string by deleting [startStr] and [endStr].
  String subStringBetween(String startStr, String endStr) {
    String result = '';
    try {
      final startIndex = _mainStr.indexOf(startStr);
      final endIndex = _mainStr.indexOf(endStr, startIndex + startStr.length);
      result = _mainStr.substring(startIndex + startStr.length, endIndex);
    } catch (exc) {
      print('$_exceptionTag$exc');
    }

    return result;
  }

  /// make a [List<String>] of given string by deleting [startStr] and [endStr].
  List<String> subStringsBetween(String startStr, String endStr) {
    List<String> results = [];
    _mainStr.split('$endStr').forEach((element) {
      if (element.isNotEmpty) {
        results.add(
            element.substring(element.indexOf('$startStr') + startStr.length));
      }
    });
    return results;
  }

  /// find [targetStr] in given string and return the sub-string after it.
  String subStringAfter(String targetStr, [bool lastIndex = false]) {
    String result = '';
    try {
      lastIndex
          ? result = _mainStr
              .substring(_mainStr.lastIndexOf('$targetStr') + targetStr.length)
          : result = _mainStr
              .substring(_mainStr.indexOf('$targetStr') + targetStr.length);
    } catch (exc) {
      print('$_exceptionTag$exc');
    }

    return result;
  }

  /// find [targetStr] in given string and return the sub-string before it.
  String subStringBefore(String targetStr, [bool lastIndex = false]) {
    String result = '';
    try {
      lastIndex
          ? result = _mainStr.substring(0, _mainStr.lastIndexOf('$targetStr'))
          : result = _mainStr.substring(0, _mainStr.indexOf('$targetStr'));
    } catch (exc) {
      print('$_exceptionTag$exc');
    }
    return result;
  }

  /// add [wordStr] in [index] of the given string.
  String insertAt(int index, String wordStr) {
    var selectStr = _mainStr[index];
    return _mainStr.replaceFirst('$selectStr', '$selectStr' + '$wordStr');
  }

  /// remove the character in [index] of the given string.
  String removeAt(int index) {
    var selectStr = _mainStr[index];
    return _mainStr.replaceFirst('$selectStr', '');
  }

  /// find the first [targetStr] in the given string and add the [word] to it.
  /// then return the result as string
  String insertAfter(String targetStr, String word) {
    return _mainStr.replaceFirst('$targetStr', '$targetStr' + '$word');
  }

  /// find every [targetStr] in the given string and add the [word] to it.
  /// then return the result as string
  String insertAfterEvery(String targetStr, String word) {
    return _mainStr.replaceAll('$targetStr', '$targetStr' + '$word');
  }

  /// find all the characters after [targetStr] and remove them from the given string.
  String removeAfter(String targetStr) {
    var tempTarget =
        _mainStr.substring(_mainStr.indexOf('$targetStr') + targetStr.length);
    return _mainStr.replaceFirst('$tempTarget', '');
  }

  /// find all the characters before [targetStr] and remove them from the given string.
  String removeBefore(String targetStr) {
    var tempTarget = _mainStr.substring(0, _mainStr.indexOf('$targetStr'));
    return _mainStr.replaceFirst('$tempTarget', '');
  }

  /// return true if the string is castable to [int] type,
  /// if it's not, return false.
  bool isNumericInt() {
    final validCharacters = RegExp(r'^[0-9]+$');

    if (validCharacters.hasMatch(_mainStr)) {
      return true;
    } else {
      return false;
    }
  }

  /// return true if the string is castable to [double] type,
  /// if it's not, return false.
  bool isNumericDouble() {
    if (_mainStr.isEmpty) {
      return false;
    }
    return double.tryParse(_mainStr) != null;
  }

  /// return true if all the characters of the given string is alphabetic characters,
  /// if it's not, return false.
  bool isAlphabetic(bool withSpace) {
    final validCharacters =
        withSpace ? RegExp(r'^[a-zA-Z ]+$') : RegExp(r'^[a-zA-Z]+$');

    if (validCharacters.hasMatch(_mainStr)) {
      return true;
    } else {
      return false;
    }
  }

  /// return true if all the characters of the given string is uppercase,
  /// if it's not, return false.
  bool isUpperCase() {
    final validCharacters = _mainStr.toUpperCase();
    if (_mainStr == validCharacters &&
        RegExp(r'^[a-zA-Z]+').hasMatch(_mainStr)) {
      return true;
    } else {
      return false;
    }
  }

  /// return true if all the characters of the given string is combination of alphabetic and numeric characters,
  /// if it's not, return false.
  bool isAlphaNumeric(bool withSpace) {
    final validCharacters =
        withSpace ? RegExp(r'^[a-zA-Z0-9 ]+$') : RegExp(r'^[a-zA-Z0-9]+$');

    if (validCharacters.hasMatch(_mainStr)) {
      return true;
    } else {
      return false;
    }
  }

  /// return true if the given string is blank
  /// if it's not, return false.
  bool isBlank() {
    final validCharacters = RegExp(r'^[ ]+$');

    if (validCharacters.hasMatch(_mainStr)) {
      return true;
    } else {
      return false;
    }
  }

  /// return true if all the characters of the given string contains special characters,
  /// if it's not, return false.
  bool isContainSpecialChar() {
    final validCharacters = RegExp(r'^[a-zA-Z0-9 ]+$');

    if (!validCharacters.hasMatch(_mainStr)) {
      return true;
    } else {
      return false;
    }
  }

  /// return true if all the characters of the given string is valid characters,
  /// if it's not, return false.
  bool isValidCharacters(RegExp validCharacters) {
    try {
      if (validCharacters.hasMatch(_mainStr)) {
        return true;
      } else {
        return false;
      }
    } catch (exc) {
      print('$_exceptionTag$exc');
      return false;
    }
  }

  /// convert all the english numbers to persian in the given string,
  /// then return the result.
  String convertEnglishNumberToPersian() {
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const farsi = ['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹'];

    for (int i = 0; i < english.length; i++) {
      _mainStr = _mainStr.replaceAll(english[i], farsi[i]);
    }
    return _mainStr;
  }

  /// convert all the persian numbers to english in the given string,
  /// then return the result.
  String convertPersianNumberToEnglish() {
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const farsi = ['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹'];

    for (int i = 0; i < farsi.length; i++) {
      _mainStr = _mainStr.replaceAll(farsi[i], english[i]);
    }
    return _mainStr;
  }

  /// add comma character to the given string to make the money format,
  /// then return the result string.
  String convertToMoneyFormat() {
    final formatter = new NumberFormat("#,###", "en_US");
    if (isNumericDouble()) {
      if (isNumericInt()) {
        return formatter.format(int.parse(_mainStr));
      }
      return formatter.format(double.parse(_mainStr));
    } else {
      return _mainStr;
    }
  }

  /// return the characters count of the given string
  int countWords(String wordStr) {
    int wordCount = 0;
    wordCount = '$wordStr'.allMatches('$_mainStr').length;
    return wordCount;
  }

  /// return the lines count of the given string
  int countLines() {
    int lineCount = 0;
    lineCount = '\n'.allMatches('$_mainStr').length;
    return lineCount + 1;
  }

  /// reverse string from the end to the start
  String reverse() {
    return _mainStr.split('').reversed.join();
  }

  /// reverse the words of the given string
  String reverseWords() {
    return _mainStr.split(' ').reversed.join(' ');
  }

  /// remove the blank lines from the given string,
  /// the return the result string.
  String removeBlankLines() {
    return _mainStr.replaceAll(new RegExp(r'(?:[\t ]*(?:\r?\n|\r))+'), '\n');
  }

  /// remove the lines that contains [wordStr] from the given string.
  String removeLinesThatContain(String wordStr) {
    var lines = _mainStr.split('\n');
    for (var lineItem in _mainStr.split('\n')) {
      if (lineItem.contains('$wordStr')) {
        lines.remove(lineItem);
      }
    }
    return lines.join('\n');
  }

  /// return true if the given string is valid Email,
  /// if it's not, return false.
  bool isEmail() {
    var emailValidation = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
    if (emailValidation.hasMatch(_mainStr)) {
      return true;
    } else {
      return false;
    }
  }

  /// convert the given string to [base64]
  /// then return the result string.
  String convertToBase64() {
    return base64.encode(utf8.encode(_mainStr));
  }

  /// convert the given [base64] to string
  /// then return the result string.
  String convertBase64ToString() {
    return utf8.decode(base64.decode(_mainStr));
  }

  List<int> convertToUTF8() {
    return utf8.encode('$_mainStr');
  }

  /// wrap the given string between the [wrapWith]
  String wrap(String wrapWith) {
    return '$wrapWith$_mainStr$wrapWith';
  }

  /// return true if the given string is valid URL,
  /// if it's not, return false.
  bool isValidUrl() {
    if (_mainStr.isEmpty) return false;
    return Uri.tryParse(_mainStr)?.hasAbsolutePath ?? false;
  }

  /// generate a secure random string
  String getRandomString(int len) {
    var random = Random.secure();
    var values = List<int>.generate(len, (i) => random.nextInt(255));
    return base64UrlEncode(values);
  }
}
