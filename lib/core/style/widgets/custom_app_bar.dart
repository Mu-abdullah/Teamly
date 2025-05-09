import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../core/style/color/app_color.dart';
import '../../../core/style/widgets/app_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,

    this.title = '',
    this.translate = true,
    this.isBack = true,
    this.hasDrawer = false,
    this.actions,
    this.backgroundColor = AppColors.scaffoldBackground,
    this.icon = HugeIcons.strokeRoundedMenu03,
    this.elevation,
    this.fontSize,
  });

  final String title;
  final bool translate;
  final bool isBack;
  final bool hasDrawer;
  final List<Widget>? actions;
  final Color backgroundColor;
  final IconData? icon;
  final double? elevation;
  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: isBack,
      leading:
          hasDrawer
              ? IconButton(
                icon: Icon(icon, color: Colors.black87),
                onPressed: () => Scaffold.of(context).openDrawer(),
              )
              : isBack
              ? IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_new_outlined,
                  color: Colors.black87,
                ),
                onPressed: () => Navigator.pop(context),
              )
              : null,
      title: AppText(title, translate: translate, fontSize: fontSize),
      actions: actions,
      backgroundColor: backgroundColor,
      elevation: elevation,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56);
}
