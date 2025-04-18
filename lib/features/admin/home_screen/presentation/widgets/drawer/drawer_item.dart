import 'package:flutter/material.dart';

import '../../../../../../core/style/color/app_color.dart';
import '../../../../../../core/style/widgets/app_text.dart';
import '../../../data/model/drawer_button_model.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({super.key, required this.item});
  final DrawerButtonModel item;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(item.icon, color: item.iconColor),
      title: AppText(item.title!, color: item.titleColor ?? AppColors.black),
      onTap: item.onTap,
    );
  }
}
