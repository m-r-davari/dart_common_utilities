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
