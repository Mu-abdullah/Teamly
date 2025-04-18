import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/style/color/app_color.dart';
import '../../../../../core/style/widgets/app_text.dart';

class AttendanceLeaving extends StatelessWidget {
  const AttendanceLeaving({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.15),
            blurRadius: 20,
            spreadRadius: 2,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Row(
                children: [
                  Icon(
                    HugeIcons.strokeRoundedTime04,
                    color: AppColors.blueAccent,
                    size: 24,
                  ),
                  const SizedBox(width: 8),
                  AppText(
                    LangKeys.attendanceLeaving,
                    isTitle: true,
                    fontSize: 20,
                    color: AppColors.blueAccent,
                  ),
                ],
              ),
            ),
            Row(
              children: [
                _buildTimeCard(
                  context,
                  label: LangKeys.checkIn,
                  buttonText: LangKeys.login,
                  icon: Icons.login_rounded,
                  color: AppColors.green,
                  onTap: () {},
                ),
                const SizedBox(width: 16),
                _buildTimeCard(
                  context,
                  label: LangKeys.checkOut,
                  buttonText: LangKeys.logout,
                  icon: Icons.logout_rounded,
                  color: AppColors.red,
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeCard(
    BuildContext context, {
    required String label,
    required String buttonText,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: Material(
        borderRadius: BorderRadius.circular(18),
        color: color.withValues(alpha: 0.1),
        child: InkWell(
          borderRadius: BorderRadius.circular(18),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                AppText(
                  label,
                  fontSize: 14,
                  color: color.withValues(alpha: 0.8),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: color.withValues(alpha: 0.3),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Icon(icon, color: AppColors.white, size: 28),
                ),
                const SizedBox(height: 12),
                AppText(buttonText, fontSize: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
