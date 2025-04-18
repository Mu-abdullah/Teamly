import 'package:flutter/material.dart';
import 'package:teamly/core/style/widgets/app_space.dart';

import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/style/color/app_color.dart';
import '../home_section_header.dart';
import 'mobile_home_emp_listview.dart';

class MobileHomeEmp extends StatelessWidget {
  const MobileHomeEmp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      height: 250,
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppSpace(space: 10),
          HomeSectionHeader(title: LangKeys.employees, onTap: () {}),
          MobileHomeEmpListview(),
        ],
      ),
    );
  }
}
