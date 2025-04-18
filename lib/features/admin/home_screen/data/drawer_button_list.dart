import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../core/language/lang_keys.dart';
import 'model/drawer_button_model.dart';

class DrawerButtonListItems {
  static List<DrawerButtonModel> drawerItems(BuildContext context) => [
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
