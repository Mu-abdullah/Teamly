import 'package:flutter/material.dart';

import '../../../../../../core/style/color/app_color.dart';
import '../../../../../../core/style/font/fonts_helper.dart';
import '../../../../../../core/style/statics/app_statics.dart';
import '../../../../../../core/style/widgets/app_text.dart';

class HomeCard extends StatefulWidget {
  const HomeCard({
    super.key,
    required this.cardTitle,
    required this.cardIcon,
    this.cardCount,
    this.color = AppColors.blueAccent,
    this.textColor = AppColors.white,
    this.isHighlighted = false,
    this.height,
    this.maxLines = 2,
    this.onTap,
  });

  final String cardTitle;
  final String? cardCount;
  final IconData cardIcon;
  final double? height;
  final Color color;
  final Color textColor;
  final bool isHighlighted;
  final int maxLines;
  final Function()? onTap;

  @override
  State<HomeCard> createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  double _scale = 1.0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    _animationController.forward().then((_) => _animationController.reverse());
  }

  @override
  Widget build(BuildContext context) {
    final isArabic = FontsHelper.isArabic(context);

    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: _onTapDown,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          _scale = 1.0 - (_animationController.value * 0.05);
          return Transform.scale(scale: _scale, child: child);
        },
        child: SizedBox(
          height: widget.height,
          child: Material(
            elevation: widget.isHighlighted ? 6 : 2,
            borderRadius: AppBorderRadius.mediumRadius,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: AppBorderRadius.mediumRadius,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors:
                      widget.isHighlighted
                          ? [
                            widget.color,
                            widget.color,
                            widget.color.withValues(alpha: 0.7),
                          ]
                          : [widget.color, widget.color],
                ),
                boxShadow: [
                  if (widget.isHighlighted)
                    BoxShadow(
                      color: widget.color.withValues(alpha: 0.4),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                ],
              ),
              child: Stack(
                children: [
                  if (widget.isHighlighted)
                    Positioned(
                      right: isArabic ? null : -30,
                      left: isArabic ? -30 : null,
                      top: -30,
                      child: AnimatedRotation(
                        duration: const Duration(seconds: 15),
                        turns: 1,

                        child: Icon(
                          widget.cardIcon,
                          size: 150,
                          color: widget.textColor.withValues(alpha: 0.1),
                        ),
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: Icon(
                            widget.cardIcon,
                            size: 32,
                            color: widget.textColor.withValues(alpha: 0.8),
                          ),
                        ),
                        const Spacer(),
                        if (widget.cardCount != null)
                          AppText(
                            widget.cardCount!,
                            color: widget.textColor,
                            translate: false,
                          ),
                        const SizedBox(height: 8),
                        AppText(
                          widget.cardTitle,
                          color: widget.textColor,
                          maxLines: widget.maxLines,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
