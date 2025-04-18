import 'package:flutter/material.dart';

import '../../../../../../core/language/lang_keys.dart';
import '../../../../../../core/style/color/app_color.dart';
import '../../../../../../core/style/statics/app_statics.dart';
import '../../../../../../core/style/widgets/app_space.dart';
import '../home_section_header.dart';
import 'home_emp_listview.dart';

class HomeEmpSection extends StatelessWidget {
  const HomeEmpSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: AppBorderRadius.mediumRadius,
        color: AppColors.white,
      ),

      height: 250,
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppSpace(space: 10),
          HomeSectionHeader(title: LangKeys.employees, onTap: () {}),
          HomeEmpListview(),
        ],
      ),
    );
  }
}
