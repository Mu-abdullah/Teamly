import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/app/user/app_user_cubit/app_user_cubit.dart';
import '../../../../../../core/functions/generate_id.dart';
import '../../../../../../core/functions/timestamp_to_time.dart';
import '../../../../../../core/language/lang_keys.dart';
import '../../../../../../core/services/supabase/backend_points.dart';
import '../../../../../../core/style/color/app_color.dart';
import '../../../../../../core/style/widgets/circle_progress.dart';
import '../../../../../../core/style/widgets/custom_snack_bar.dart';
import '../../../data/model/attendance_model.dart';
import '../../cubits/attendance_cubit/attendance_cubit.dart';
import '../../cubits/attendance_history_cubit/attendance_history_cubit.dart';
import '../../cubits/check_attendance_cubit/check_attendance_cubit.dart';
import 'atttendance_button.dart';

class CheckInOutButtons extends StatelessWidget {
  const CheckInOutButtons({
    super.key,
    required this.cubit,
    required this.showCheckIn,
    required this.showCheckOut,
  });

  final CheckAttendanceCubit cubit;
  final bool showCheckIn;
  final bool showCheckOut;

  @override
  Widget build(BuildContext context) {
    final uid = context.read<AppUserCubit>().userId;
    final com = context.read<AppUserCubit>().compId;
    final attendanceCubit = AttendanceCubit.get(context);

    return BlocListener<AttendanceCubit, AttendanceState>(
      listener: (context, state) {
        if (state is AttendanceLoading) {
          showProgressIndicator(context);
        } else if (state is AttendanceError) {
          Navigator.pop(context);
          CustomSnackbar.showTopSnackBar(
            context,
            message: state.message,
            translate: false,
            backgroundColor: AppColors.red,
          );
        } else if (state is AttendanceLoaded) {
          Navigator.pop(context);
          cubit.checkAttendance(uid);
          context.read<AttendanceHistoryCubit>().getHistory(uid);
        }
      },
      child: Row(
        children: [
          if (showCheckIn)
            AttendanceButton(
              label: LangKeys.checkIn,
              buttonText: LangKeys.login,
              icon: Icons.login_rounded,
              color: AppColors.green,
              onTap: () {
                final model = AttendanceModel(
                  date: TimeRefactor.currentDateString(),
                  userId: uid,
                  companyId: com,
                  checkIn: DateTime.now().toString(),
                  checkOut: null,
                  id: GenerateId.generateDocumentId(
                    context: context,
                    tableName: BackendPoint.attendance,
                    companyName: com,
                  ),
                  empId: uid,
                );
                debugPrint("uid : $uid");
                attendanceCubit.checkIn(model: model);
              },
            ),
          if (showCheckIn && showCheckOut) const SizedBox(width: 16),
          if (showCheckOut)
            AttendanceButton(
              label: LangKeys.checkOut,
              buttonText: LangKeys.logout,
              icon: Icons.logout_rounded,
              color: AppColors.red,
              onTap: () {
                attendanceCubit.checkOut(
                  checkOut: DateTime.now().toString(),
                  userId: uid,
                  date: TimeRefactor.currentDateString(),
                );
              },
            ),
        ],
      ),
    );
  }
}
