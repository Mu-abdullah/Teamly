import 'package:flutter/material.dart';

class ButtonsEntity {
  final String? title;
  final Color? titleColor;
  final IconData? icon;
  final Color? iconColor;
  final Function()? onTap;

  ButtonsEntity({
    this.title,
    this.icon,
    this.titleColor,
    this.iconColor,
    this.onTap,
  });
}
