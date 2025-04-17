import 'package:flutter/material.dart';

class FontsHelper {
  static const String fontFamily = 'monsterrat';

  static String getAppLangCode(BuildContext context) {
    final currentLocale = Localizations.localeOf(context);

    return currentLocale.languageCode;
  }

  static bool isArabic(BuildContext context) {
    if (FontsHelper.getAppLangCode(context) == 'ar') {
      return true;
    } else {
      return false;
    }
  }
}
