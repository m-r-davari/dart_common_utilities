# common_utilities

A Dart language Common Utility package, that makes your code faster,easier and cleaner. contains lots of useful functions for Dart primitive types (support all Flutter platforms)

## Features

- **String** : Over 35 useful String utility functions.


## Todo (Next Versions)

- Add **Numbers** (int, double, num, BigInt) utility functions.
- Add **Booleans** (bool) utility functions.
- Add **Lists** (List) utility functions.

## Notes
**version 0.1.0  Includes only String utils**.

## Usage

add this line to your `pubspec.yaml` :

```yaml
    dependencies:
      common_utilities: ^0.1.0
```

or enter this to your command line: 

```yaml
    flutter pub add common_utilities
```


## String Utils
Includes over 30 useful string functions such as :

1. subStringBetween
2. subStringsBetween
3. subStringBetween
4. subStringsBetween
5. subStringAfter
6. subStringBefore
7. subStringAfter
8. subStringBefore
9. insertAt
10. removeAt
11. insertAfter
12. insertAfterEvery
13. removeAfter
14. removeBefore
15. isNumericInt
16. isNumericDouble
17. isAlphabetic
18. isUpperCase
19. isAlphaNumeric
20. isBlank
21. isContainSpecialChar
22. isValidCharacters
23. convertEnglishNumberToPersian
24. convertPersianNumberToEnglish
25. convertToMoneyFormat
26. countWords
27. countLines
28. reverse
29. reverseWords
30. removeBlankLines
31. removeLinesThatContain
32. isEmail
33. convertToBase64
34. convertBase64ToString
35. convertToUTF8

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