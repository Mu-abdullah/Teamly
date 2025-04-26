import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:teamly/core/extextions/extentions.dart';

import '../../../../core/language/lang_keys.dart';
import '../../../../core/routes/routes_name.dart';
import 'model/drawer_button_model.dart';

class DrawerButtonListItems {
  static List<DrawerButtonModel> drawerItems(BuildContext context) => [
    DrawerButtonModel(
      title: LangKeys.profile,
      icon: HugeIcons.strokeRoundedUserAccount,
      onTap: () {
        context.pushNamed(RoutesNames.empProfileScreen);
      },
    ),
    DrawerButtonModel(
      title: LangKeys.addCompany,
      icon: HugeIcons.strokeRoundedFactory01,
      onTap: () {},
    ),
    DrawerButtonModel(
      title: LangKeys.addEmployee,
      icon: HugeIcons.strokeRoundedUserCircle,
      onTap: () {},
    ),
  ];
}
