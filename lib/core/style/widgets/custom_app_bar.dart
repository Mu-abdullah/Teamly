import 'package:flutter/material.dart';
import '../../../core/extextions/extentions.dart';
import '../../../core/style/color/app_color.dart';
import '../../../core/style/widgets/app_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.translatedTitle,
    this.title = '',
    this.isBack = true,
    this.actions,
    this.backgroundColor = AppColors.white,
  });
  final String? translatedTitle;
  final String title;
  final bool isBack;
  final List<Widget>? actions;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    var dispalayTitle =
        translatedTitle != null ? context.translate(translatedTitle!) : title;
    return AppBar(
      automaticallyImplyLeading: isBack,
      leading: isBack
          ? IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_outlined),
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
