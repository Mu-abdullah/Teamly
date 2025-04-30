import 'package:flutter/material.dart';
import 'package:teamly/core/language/lang_keys.dart';

import '../../style/color/app_color.dart';

class JobStatus {
  static const String onWork = 'onWork';
  static const String terminated = 'terminated';
  static const String resigned = 'resigned';

  static String jobStatus(String status) {
    if (status == onWork) {
      return LangKeys.onWork;
    } else if (status == terminated) {
      return LangKeys.terminated;
    } else {
      return LangKeys.resigned;
    }
  }

  static Color statusColor(String status) {
    if (status == onWork) {
      return AppColors.green;
    } else if (status == terminated) {
      return AppColors.red;
    } else {
      return AppColors.yellow;
    }
  }
}
