import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import '../../../core/extextions/extentions.dart';
import '../../../core/style/color/app_color.dart';
import '../../../core/style/widgets/app_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.translatedTitle,
    this.title = '',
    this.isBack = true,
    this.hasDrawer = false,
    this.actions,
    this.backgroundColor = AppColors.scaffoldBackground,
    this.icon = HugeIcons.strokeRoundedMenu03,
  });
  final String? translatedTitle;
  final String title;
  final bool isBack;
  final bool hasDrawer;
  final List<Widget>? actions;
  final Color backgroundColor;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    var dispalayTitle =
        translatedTitle != null ? context.translate(translatedTitle!) : title;
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
      title: AppText(dispalayTitle, isTitle: true),
      actions: actions,
      backgroundColor: backgroundColor,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56);
}
