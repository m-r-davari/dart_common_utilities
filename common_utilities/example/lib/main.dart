import 'package:common_utilities/common_utilities.dart';

void main() {
  String mainStr =
      'If you want something you have never had you must do something you have never done';

  String result = mainStr.stringUtils().subStringBetween('want', 'never');
  // prints =>  'something you have'

  List<String> result2 =
      mainStr.stringUtils().subStringsBetween('you', 'never');
  // prints =>  ['something you have' , 'must do something you have']

  String result3 = mainStr.stringUtils().subStringAfter('something');
  // prints =>  'you have never had you must do something you have never done'

  bool lastIndex = true; //This is optional & its false by default
  String result4 = mainStr.stringUtils().subStringAfter('something', lastIndex);
  // prints =>  'you have never done'
}
