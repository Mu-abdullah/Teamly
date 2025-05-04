import 'package:flutter/material.dart';
import 'package:teamly/core/extextions/extentions.dart';

import '../../../../../core/style/color/app_color.dart';
import '../../../../../core/style/statics/app_statics.dart';
import '../../../../../core/style/widgets/app_space.dart';
import '../widgets/co_name_logo/co_name_logo.dart';
import '../widgets/emp_count/home_emp_count_body.dart';
import '../widgets/home_comp/home_companies.dart';
import '../widgets/home_custody/home_admin_custody.dart';
import '../widgets/home_vacations_attendance/home_vacations_attendance.dart';
import '../widgets/home_emp/home_emp.dart';

class HomeMobileBody extends StatelessWidget {
  const HomeMobileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: 10,
        children: [
          CoNameLogo(),
          Counts(),
          HomeCompaniesSection(),
          HomeEmpSection(),
          AppSpace(space: 10),
        ],
      ),
    );
  }
}

class Counts extends StatelessWidget {
  const Counts({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: AppBorderRadius.mediumRadius,
      ),
      height: context.height(percent: .5),
      child: Column(
        spacing: context.height(percent: .009),
        children: [
          AppSpace(space: context.height(percent: .001)),
          HomeEmpCountBody(height: context.height(percent: .15)),
          HomeVacationAttendance(height: context.height(percent: .15)),
          HomeAdminCustody(height: context.height(percent: .15)),
        ],
      ),
    );
  }
}
