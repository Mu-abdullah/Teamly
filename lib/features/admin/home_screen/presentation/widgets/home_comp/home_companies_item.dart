import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../../../core/style/color/app_color.dart';
import '../../../../../../core/style/statics/app_statics.dart';
import '../../../../../../core/style/statics/image_test.dart';
import '../../../../../../core/style/widgets/app_text.dart';

class HomeCompaniesItem extends StatelessWidget {
  const HomeCompaniesItem({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.white, Colors.grey.shade50],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: AppBorderRadius.largeRadius,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 12,
              spreadRadius: 2,
              blurStyle: BlurStyle.solid,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: AppBorderRadius.largeRadius,
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Animate(
                    effects: [
                      ScaleEffect(
                        begin: Offset(0.8, 0.8),
                        end: Offset(1, 1),
                        duration: Duration(milliseconds: 500),
                      ),
                    ],
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: RadialGradient(
                              colors: [
                                AppColors.blueAccent.withValues(alpha: 0.2),
                                Colors.transparent,
                              ],
                            ),
                          ),
                        ),
                        CircleAvatar(
                          radius: 24,
                          backgroundImage: const NetworkImage(ImageTest.bloger),
                          backgroundColor: Colors.grey.shade200,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Company details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          'شركة ${index + 1}',
                          fontSize: 18,
                          translate: false,
                        ),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            _buildDateChip('من 2024'),
                            const SizedBox(width: 8),
                            _buildDateChip('حتى 2025'),
                          ],
                        ),
                      ],
                    ),
                  ),

                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Colors.grey.shade600,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ).animate().fadeIn(duration: 1000.ms, delay: (1 * index).ms);
  }

  // Helper widget for date chips
  Widget _buildDateChip(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.blueAccent.withValues(alpha: 0.1),
        borderRadius: AppBorderRadius.largeRadius,
      ),
      child: AppText(
        text,
        fontSize: 12,
        color: AppColors.blueAccent,
        translate: false,
      ),
    );
  }
}
