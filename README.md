# common_utilities

A Dart language Common Utility package, that makes your code faster,easier and cleaner. contains lots of useful functions for Dart primitive types (support all Flutter platforms)

## Features

- **String** : Over 30 useful String utility functions.


## Todo (Next Versions)

- Add **Numbers** (int, double, num, BigInt) utility functions.
- Add **Booleans** (bool) utility functions.
- Add **Lists** (List) utility functions.

## Notes
**version 0.1.1  Includes only String utils**.

## Usage

add this line to your `pubspec.yaml` :

```yaml
    dependencies:
      common_utilities: ^0.1.1
```

or enter this to your command line: 

```yaml
    flutter pub add common_utilities
```


## String Utils
Includes over 30 useful string functions such as :

1. subStringBetween
2. subStringsBetween
3. subStringAfter
4. subStringBefore
5. insertAt
6. removeAt
7. insertAfter
8. insertAfterEvery
9. removeAfter
10. removeBefore
11. isNumericInt
12. isNumericDouble
13. isAlphabetic
14. isUpperCase
15. isAlphaNumeric
16. isBlank
17. isContainSpecialChar
18. isValidCharacters
19. convertEnglishNumberToPersian
20. convertPersianNumberToEnglish
21. convertToMoneyFormat
22. countWords
23. countLines
24. reverse
25. reverseWords
26. removeBlankLines
27. removeLinesThatContain
28. isEmail
29. convertToBase64
30. convertBase64ToString
31. convertToUTF8
32. wrap
33. isValidUrl

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

## More Info
- This package is equivalent of Common Utils library in Java, by this package there is no more need to write utils functions, just add it to your project and enjoy.
- Feel free to make pull request to add your desire functions if its not included in the package functions list.