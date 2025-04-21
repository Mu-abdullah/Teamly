import 'package:flutter/material.dart';

import '../../../../../../core/style/color/app_color.dart';
import '../../../../../../core/style/font/fonts_helper.dart';
import '../../../../../../core/style/statics/app_statics.dart';
import '../../../../../../core/style/widgets/app_text.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({
    super.key,
    required this.cardTitle,
    this.cardCount,
    required this.cardIcon,
    this.color = AppColors.blueAccent,
    this.textColor = AppColors.white,
    this.isHighlighted = false,
    this.height,
  });
  final String cardTitle;
  final String? cardCount;
  final IconData cardIcon;
  final double? height;
  final Color color;
  final Color textColor;
  final bool isHighlighted;
  @override
  Widget build(BuildContext context) {
    var isArabic = FontsHelper.isArabic(context);
    return Padding(
      padding: AppPadding.smallPadding,
      child: SizedBox(
        height: height,

        child: Material(
          elevation: 2,
          borderRadius: AppBorderRadius.mediumRadius,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: color,
              borderRadius: AppBorderRadius.mediumRadius,
              gradient:
                  isHighlighted
                      ? LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [color, color.withValues(alpha: 0.8)],
                      )
                      : null,
            ),
            child: Stack(
              children: [
                if (isHighlighted)
                  Positioned(
                    right: isArabic ? null : 0,
                    left: isArabic ? -0 : null,
                    top: 0,
                    child: Icon(
                      cardIcon,
                      size: 100,
                      color: textColor.withValues(alpha: 0.2),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(cardIcon, size: 32, color: textColor),

                      cardCount != null
                          ? AppText(
                            cardCount!,
                            isTitle: isHighlighted,
                            color: textColor,
                            translate: false,
                          )
                          : const SizedBox(),

                      AppText(
                        cardTitle,
                        isTitle: isHighlighted,
                        color: textColor.withValues(alpha: 0.9),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
