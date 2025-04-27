import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/style/color/app_color.dart';
import '../../../../../../../core/style/widgets/app_text.dart';
import '../../../../../../core/app/user/app_user_cubit/app_user_cubit.dart';
import '../../cubits/check_attendance_cubit/check_attendance_cubit.dart';
import '../user_card_loading.dart';
import 'attendance_done.dart';
import 'check_attendance.dart';

class AttendanceLeavingBody extends StatelessWidget {
  const AttendanceLeavingBody({super.key});

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
      child: BlocBuilder<CheckAttendanceCubit, CheckAttendanceState>(
        builder: (context, state) {
          final cubit = CheckAttendanceCubit.get(context);

          if (state is CheckAttendanceLoading) {
            return const UserCardLoading();
          } else if (state is CheckAttendanceError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(state.message),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {
                      final uid = context.read<AppUserCubit>().userId;
                      cubit.checkAttendance(uid);
                    },
                    child: const Text("Retry"),
                  ),
                ],
              ),
            );
          } else if (state is CheckAttendanceLoaded) {
            final model = state.model;
            if (model.checkIn != null && model.checkOut != null) {
              return AttendancDone(
                checkIn: model.checkIn!,
                checkOut: model.checkOut!,
              );
            } else {
              return CheckAttendance(
                cubit: cubit,
                showCheckIn: model.checkIn == null,
                showCheckOut: model.checkIn != null && model.checkOut == null,
              );
            }
          }
          // Handle initial state by fetching data
          WidgetsBinding.instance.addPostFrameCallback((_) {
            final uid = context.read<AppUserCubit>().userId;
            if (uid.isNotEmpty) {
              cubit.checkAttendance(uid);
            }
          });
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
