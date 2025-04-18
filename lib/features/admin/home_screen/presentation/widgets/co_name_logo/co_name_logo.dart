import 'package:flutter/material.dart';

import '../../../../../../core/style/color/app_color.dart';
import '../../../../../../core/style/statics/app_statics.dart';
import '../../../../../../core/style/statics/image_test.dart';
import '../../../../../../core/style/widgets/app_text.dart';

class CoNameLogo extends StatefulWidget {
  const CoNameLogo({super.key});

  @override
  State<CoNameLogo> createState() => _CoNameLogoState();
}

class _CoNameLogoState extends State<CoNameLogo> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.smallPadding,
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: GestureDetector(
          onTap: () => _handleCompanyLogoPress(context),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: 160,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: AppBorderRadius.largeRadius,
              boxShadow: [
                BoxShadow(
                  color: AppColors.black.withValues(
                    alpha: _isHovered ? 0.2 : 0.1,
                  ),
                  spreadRadius: _isHovered ? 5 : 2,
                  blurRadius: _isHovered ? 24 : 12,
                  offset: Offset(0, _isHovered ? 10 : 4),
                ),
              ],
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                // Animated background element
                Positioned(
                  right: -30,
                  top: -30,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 800),
                    curve: Curves.easeInOutQuad,
                    width: 160,
                    height: 160,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.black.withValues(
                        alpha: _isHovered ? 0.1 : 0.05,
                      ),
                    ),
                  ),
                ),

                // Main content
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Logo with animated scale
                      AnimatedScale(
                        duration: const Duration(milliseconds: 200),
                        scale: _isHovered ? 1.1 : 1.0,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.1),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Image.asset(
                            AppImages.whiteLogo,
                            width: 80,
                            height: 80,
                          ),
                        ),
                      ),

                      const SizedBox(width: 24),

                      // Company name section
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AnimatedDefaultTextStyle(
                              duration: const Duration(milliseconds: 200),
                              style: Theme.of(
                                context,
                              ).textTheme.headlineSmall!.copyWith(
                                color: AppColors.black,
                                fontWeight: FontWeight.w700,
                                letterSpacing: _isHovered ? 1 : 0.5,
                              ),
                              child: const AppText(
                                "تيملي للموارد البشرية",
                                isTitle: true,
                                translate: false,
                              ),
                            ),
                            const SizedBox(height: 8),
                            AppText(
                              "Human Resources Solutions",
                              translate: false,
                            ),
                          ],
                        ),
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

  void _handleCompanyLogoPress(BuildContext context) {}
}
