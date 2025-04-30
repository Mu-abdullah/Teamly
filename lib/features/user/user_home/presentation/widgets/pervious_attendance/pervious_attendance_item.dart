import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:teamly/core/extextions/extentions.dart';

import '../../../../../../core/functions/timestamp_to_time.dart';
import '../../../../../../core/language/lang_keys.dart';
import '../../../../../../core/style/color/app_color.dart';
import '../../../../../../core/style/statics/app_statics.dart';
import '../../../../../../core/style/widgets/app_text.dart';
import '../../../data/model/history_attendance_model.dart';

class PreviousAttendanceItem extends StatelessWidget {
  const PreviousAttendanceItem({super.key, required this.item});
  final HistoryAttendanceModel item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: SizedBox(
        width: context.width(percent: 0.75),
        height: 200,
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors:
                    item.checkOut != null
                        ? [AppColors.green, AppColors.white]
                        : [AppColors.yellow, AppColors.white],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: AppBorderRadius.largeRadius,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ClipPath(
              clipper: _DiagonalClipper(),
              child: Stack(
                children: [
                  Positioned.fill(child: _buildShimmerEffect()),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    child: Column(
                      spacing: 10,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildHeaderSection(),
                        _buildTimeDetailsSection(),
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

  Widget _buildHeaderSection() {
    return Row(
      spacing: 16,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildStatusIndicator(),
        Expanded(child: AppText(item.date!, translate: false, isTitle: true)),
      ],
    );
  }

  Widget _buildStatusIndicator() {
    final duration = TimeRefactor(
      item.checkIn!,
    ).calculateDuration(item.checkOut);

    final minutes = duration.inMinutes.toDouble();
    final totalMinutes = minutes.clamp(0, 480);
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.black.withValues(alpha: 0.1),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
      ),
      child: CircleAvatar(
        child: Stack(
          children: [
            _buildProgressCircle(totalMinutes),
            Positioned.fill(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: Icon(
                  item.checkOut != null
                      ? HugeIcons.strokeRoundedCheckmarkCircle01
                      : HugeIcons.strokeRoundedMinusSign,
                  color:
                      item.checkOut != null
                          ? AppColors.green
                          : AppColors.orange,
                  size: 28,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeDetailsSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.white.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          _buildTimeRow(
            LangKeys.checkIn,
            TimeRefactor(item.checkIn!).toTimeString(),
          ),
          const Divider(height: 24, thickness: 0.5),
          _buildTimeRow(
            LangKeys.checkOut,
            item.checkOut != null
                ? TimeRefactor(item.checkOut!).toTimeString()
                : null,
          ),
          if (item.checkOut != null) ...[
            const Divider(height: 24, thickness: 0.5),
            _buildTimeRow(
              LangKeys.manyHours,
              TimeRefactor(
                item.checkIn!,
              ).timeDifferenceInHoursAndMinutes(item.checkOut!),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildTimeRow(String title, String? value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText(title),
        AppText(
          value ?? LangKeys.noLogout,
          translate: value == null ? true : false,
          color: value != null ? AppColors.black : AppColors.red,
        ),
      ],
    );
  }

  Widget _buildProgressCircle(totalMinutes) {
    final workedMinutes = totalMinutes;

    return CircularProgressIndicator(
      value: workedMinutes / 480,
      backgroundColor: AppColors.darkGrey.withValues(alpha: 0.5),
      valueColor: AlwaysStoppedAnimation<Color>(
        workedMinutes >= 480 ? AppColors.green : AppColors.red,
      ),
      trackGap: 8,
    );
  }

  Widget _buildShimmerEffect() {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 1000),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white.withValues(alpha: 0.1),
              Colors.black12.withValues(alpha: 0.3),
              Colors.white.withValues(alpha: 0.1),
            ],
            stops: const [0.1, 0.5, 0.9],
            begin: Alignment(-1.0, -0.5),
            end: Alignment(1.0, 0.5),
            tileMode: TileMode.clamp,
          ),
        ),
      ),
    );
  }
}

class _DiagonalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width - 30, 0);
    path.lineTo(size.width, 30);
    path.lineTo(size.width, size.height);
    path.lineTo(30, size.height);
    path.lineTo(0, size.height - 30);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
