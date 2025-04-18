import 'package:flutter/material.dart';

import '../../../../../core/style/color/app_color.dart';
import '../../../../../core/style/statics/app_statics.dart';
import '../../../../../core/style/widgets/app_text.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({
    super.key,
    required this.cardTitle,
    required this.cardCount,
    required this.cardIcon,
    this.color = AppColors.blueAccent,
    this.textColor = AppColors.white,
    this.isHighlighted = false,
  });
  final String cardTitle;
  final String cardCount;
  final IconData cardIcon;
  final Color color;
  final Color textColor;
  final bool isHighlighted;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Material(
        elevation: 2,
        borderRadius: AppBorderRadius.mediumRadius,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
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
                  right: -30,
                  top: -30,
                  child: Icon(
                    cardIcon,
                    size: 100,
                    color: textColor.withValues(alpha: 0.2),
                  ),
                ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(cardIcon, size: 32, color: textColor),
                  const SizedBox(height: 16),
                  AppText(
                    cardCount,
                    isTitle: isHighlighted,
                    color: textColor,
                    translate: false,
                  ),
                  const SizedBox(height: 4),
                  AppText(
                    cardTitle,
                    isTitle: isHighlighted,
                    color: textColor.withValues(alpha: 0.9),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
