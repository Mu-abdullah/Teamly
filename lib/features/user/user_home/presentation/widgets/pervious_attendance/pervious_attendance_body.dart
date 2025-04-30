import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/language/lang_keys.dart';
import '../../../../../../core/style/color/app_color.dart';
import '../../../../../../core/style/widgets/app_space.dart';
import '../../../../../../core/style/widgets/app_text.dart';
import '../../cubits/attendance_history_cubit/attendance_history_cubit.dart';
import 'hostory_loading.dart';
import 'pervious_attendance_listview.dart';

class PerviousAttendance extends StatelessWidget {
  const PerviousAttendance({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AttendanceHistoryCubit, AttendanceHistoryState>(
      builder: (context, state) {
        if (state is HistoryLoading) {
          return HistoryLoadingShimmer();
        } else if (state is HistoryLoadError) {
          return Center(child: Text('Error: ${state.error}'));
        } else if (state is HistoryLoaded) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.white,

                boxShadow: [
                  BoxShadow(
                    color: AppColors.black.withAlpha(
                      38,
                    ), // Equivalent to 0.15 opacity
                    blurRadius: 20,
                    spreadRadius: 2,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppSpace(),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: AppText(LangKeys.lastAttendance, isTitle: true),
                  ),
                  PerviousAttendanceListview(attendanceItems: state.history),
                ],
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
