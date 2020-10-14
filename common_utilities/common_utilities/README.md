# common_utilities

A Dart Common Utility Package . That contain useful functions for different classes.

Includes a set of **String** , **Int** , **List** functions and so on. that make your work much faster and easier.

**version 0.0.4  Includes only String utils**.

## String Utils
Includes over 30 useful string functions such as :

1. subStringBetween
1. subStringsBetween
1. subStringBetween
1. subStringsBetween
1. subStringAfter
1. subStringBefore
1. subStringAfter
1. subStringBefore
1. insertAt
1. removeAt
1. insertAfter
1. insertAfterEvery
1. removeAfter
1. removeBefore
1. isNumericInt
1. isNumericDouble
1. isAlphabetic
1. isUpperCase
1. isAlphaNumeric
1. isBlank
1. isContainSpecialChar
1. isValidCharacters
1. convertEnglishNumberToPersian
1. convertPersianNumberToEnglish
1. convertToMoneyFormat
1. countWords
1. countLines
1. reverse
1. reverseWords
1. removeBlankLines
1. removeLinesThatContain
1. isEmail
1. convertToBase64
1. convertBase64ToString
1. convertToUTF8

## How To Use
### Example for StringUtils :

```dart
import 'package:common_utilities/common_utilities.dart';

void main() {
  
  String mainStr = 'If you want something you have never had you must do something you have never done';

  String result  = mainStr.StringUtils().subStringBetween('want', 'never');
  // prints =>  'something you have'

  List<String> result2  = mainStr.StringUtils().subStringsBetween('you', 'never');
  // prints =>  ['something you have' , 'must do something you have']

  
  String result3  = mainStr.StringUtils().subStringAfter('something');
  // prints =>  'you have never had you must do something you have never done'

  bool lastIndex = true; //This is optional & its false by default
  String result4  = mainStr.StringUtils().subStringAfter('something',lastIndex);
  // prints =>  'you have never done'
  
}
```

## Changelog

Refer to the [Changelog](https://pub.dev/packages/common_utilities/changelog) to get all release notes.