import 'package:intl/intl.dart';
import 'dart:convert' show utf8, base64;

class CommonStringUtils {
  static final String _exceptionTag = 'Exception on StringUtils : ';
  static final CommonStringUtils stringUtils = CommonStringUtils._();
  String _mainStr = '';

  CommonStringUtils._();

  void construct(String mainStr) {
    this._mainStr = mainStr;
  }

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

  String insertAt(int index, String wordStr) {
    var selectStr = _mainStr[index];
    return _mainStr.replaceFirst('$selectStr', '$selectStr' + '$wordStr');
  }

  String removeAt(int index) {
    var selectStr = _mainStr[index];
    return _mainStr.replaceFirst('$selectStr', '');
  }

  String insertAfter(String targetStr, String word) {
    return _mainStr.replaceFirst('$targetStr', '$targetStr' + '$word');
  }

  String insertAfterEvery(String targetStr, String word) {
    return _mainStr.replaceAll('$targetStr', '$targetStr' + '$word');
  }

  String removeAfter(String targetStr) {
    var tempTarget =
        _mainStr.substring(_mainStr.indexOf('$targetStr') + targetStr.length);
    return _mainStr.replaceFirst('$tempTarget', '');
  }

  String removeBefore(String targetStr) {
    var tempTarget = _mainStr.substring(0, _mainStr.indexOf('$targetStr'));
    return _mainStr.replaceFirst('$tempTarget', '');
  }

  bool isNumericInt() {
    final validCharacters = RegExp(r'^[0-9]+$');

    if (validCharacters.hasMatch(_mainStr)) {
      return true;
    } else {
      return false;
    }
  }

  bool isNumericDouble() {
    if (_mainStr.isEmpty) {
      return false;
    }
    return double.tryParse(_mainStr) != null;
  }

  bool isAlphabetic(bool withSpace) {
    final validCharacters =
        withSpace ? RegExp(r'^[a-zA-Z ]+$') : RegExp(r'^[a-zA-Z]+$');

    if (validCharacters.hasMatch(_mainStr)) {
      return true;
    } else {
      return false;
    }
  }

  bool isUpperCase() {
    final validCharacters = _mainStr.toUpperCase();
    if (_mainStr == validCharacters &&
        RegExp(r'^[a-zA-Z]+').hasMatch(_mainStr)) {
      return true;
    } else {
      return false;
    }
  }

  bool isAlphaNumeric(bool withSpace) {
    final validCharacters =
        withSpace ? RegExp(r'^[a-zA-Z0-9 ]+$') : RegExp(r'^[a-zA-Z0-9]+$');

    if (validCharacters.hasMatch(_mainStr)) {
      return true;
    } else {
      return false;
    }
  }

  bool isBlank() {
    final validCharacters = RegExp(r'^[ ]+$');

    if (validCharacters.hasMatch(_mainStr)) {
      return true;
    } else {
      return false;
    }
  }

  bool isContainSpecialChar() {
    final validCharacters = RegExp(r'^[a-zA-Z0-9 ]+$');

    if (!validCharacters.hasMatch(_mainStr)) {
      return true;
    } else {
      return false;
    }
  }

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

  String convertEnglishNumberToPersian() {
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const farsi = ['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹'];

    for (int i = 0; i < english.length; i++) {
      _mainStr = _mainStr.replaceAll(english[i], farsi[i]);
    }
    return _mainStr;
  }

  String convertPersianNumberToEnglish() {
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const farsi = ['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹'];

    for (int i = 0; i < farsi.length; i++) {
      _mainStr = _mainStr.replaceAll(farsi[i], english[i]);
    }
    return _mainStr;
  }

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

  int countWords(String wordStr) {
    int wordCount = 0;
    wordCount = '$wordStr'.allMatches('$_mainStr').length;
    return wordCount;
  }

  int countLines() {
    int lineCount = 0;
    lineCount = '\n'.allMatches('$_mainStr').length;
    return lineCount + 1;
  }

  String reverse() {
    return _mainStr.split('').reversed.join();
  }

  String reverseWords() {
    return _mainStr.split(' ').reversed.join(' ');
  }

  String removeBlankLines() {
    return _mainStr.replaceAll(new RegExp(r'(?:[\t ]*(?:\r?\n|\r))+'), '\n');
  }

  String removeLinesThatContain(String wordStr) {
    var lines = _mainStr.split('\n');
    for (var lineItem in _mainStr.split('\n')) {
      if (lineItem.contains('$wordStr')) {
        lines.remove(lineItem);
      }
    }
    return lines.join('\n');
  }

  bool isEmail() {
    var emailValidation = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
    if (emailValidation.hasMatch(_mainStr)) {
      return true;
    } else {
      return false;
    }
  }

  String convertToBase64() {
    return base64.encode(utf8.encode(_mainStr));
  }

  String convertBase64ToString() {
    return utf8.decode(base64.decode(_mainStr));
  }

  List<int> convertToUTF8() {
    return utf8.encode('$_mainStr');
  }

  String wrap(String wrapWith) {
    return '$wrapWith$_mainStr$wrapWith';
  }
}
