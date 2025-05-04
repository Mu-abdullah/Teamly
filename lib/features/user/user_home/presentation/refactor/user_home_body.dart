import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/app/user/app_user_cubit/app_user_cubit.dart';
import '../../../../../core/style/font/fonts_helper.dart';
import '../cubits/check_attendance_cubit/check_attendance_cubit.dart';
import '../widgets/attendance_buttons/attendance_leaving_body.dart';
import '../widgets/pervious_attendance/pervious_attendance_body.dart';
import '../widgets/user_info/user_home_card.dart';
import '../widgets/custody_vacation_salary_cards.dart';

class UserHomeBody extends StatefulWidget {
  const UserHomeBody({super.key});

  @override
  State<UserHomeBody> createState() => _UserHomeBodyState();
}

class _UserHomeBodyState extends State<UserHomeBody> {
  @override
  void initState() {
    super.initState();
    final uid = context.read<AppUserCubit>().empID;
    if (uid.isNotEmpty) {
      CheckAttendanceCubit.get(context).checkAttendance(uid);
    }
  }

  @override
  Widget build(BuildContext context) {
    var isArabic = FontsHelper.isArabic(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          UserHomeCard(isArabic: isArabic),
          AttendanceLeavingBody(),
          CustodySalaryVacationCards(),
          PerviousAttendance(),
        ],
      ),
    );
  }
}
