library common_utilities;
import 'package:common_utilities/src/StringUtils.dart';


extension StringUtil on String {

  CommonStringUtils StringUtils (){
    var instance = CommonStringUtils.stringUtils;
    instance.construct(this);
    return instance;
  }

}
