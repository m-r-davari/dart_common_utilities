# common_utilities

A Dart Common Utility Package . That contain useful functions for different classes.

Includes a set of **String** , **Int** , **List** functions and so on. that make your work much faster and easier.

**version 0.0.10  Includes only String utils**.

## Usage

add this line to your `pubspec.yaml` :

```yaml
    dependencies:
      common_utilities: ^0.0.10
```

or enter this to your command line: 

```yaml
    flutter pub add common_utilities
```


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
  String yourStr = 'If you want something you have never had you must do something you have never done';

  String result = yourStr.stringUtils().subStringBetween('want', 'never');
  // print(result) =>  'something you have'

  List<String> result2 = yourStr.stringUtils().subStringsBetween('you', 'never');
  // print(result2) =>  ['something you have' , 'must do something you have']

  String result3 = yourStr.stringUtils().subStringAfter('something');
  // print(result3) =>  'you have never had you must do something you have never done'

  bool lastIndex = true; //This is optional & its false by default
  String result4 = yourStr.stringUtils().subStringAfter('something', lastIndex);
  // print(result4) =>  'you have never done'

  String str = CommonUtils.getRandomString(10);
  // print(str) =>  'btorklcvxw'

}
```

## Changelog

Refer to the [Changelog](https://pub.dev/packages/common_utilities/changelog) to get all release notes.