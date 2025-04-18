import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/style/widgets/app_space.dart';
import '../../../../../core/style/widgets/app_text.dart';
import 'home_drawer_button_list.dart';

class CustomHomeDrawer extends StatelessWidget {
  const CustomHomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            AppSpace(space: 30),
            Row(
              children: [
                Expanded(child: AppText(LangKeys.menue, isTitle: true)),
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Icon(HugeIcons.strokeRoundedCancelSquare),
                ),
              ],
            ),
            DrawerButtonList(),
          ],
        ),
      ),
    );
  }
}
