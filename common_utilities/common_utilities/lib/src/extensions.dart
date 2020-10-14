import 'string_utils.dart';

extension StringUtil on String {

  CommonStringUtils StringUtils (){
    var instance = CommonStringUtils.stringUtils;
    instance.construct(this);
    return instance;
  }

}