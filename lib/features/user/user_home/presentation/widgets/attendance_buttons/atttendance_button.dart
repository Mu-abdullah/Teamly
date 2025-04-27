import 'package:flutter/material.dart';

import '../../../../../../core/style/color/app_color.dart';
import '../../../../../../core/style/widgets/app_text.dart';

class AttendanceButton extends StatelessWidget {
  const AttendanceButton({
    super.key,

    required this.label,
    required this.buttonText,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  final String label;
  final String buttonText;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
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
