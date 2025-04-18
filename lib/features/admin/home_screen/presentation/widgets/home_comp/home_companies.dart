import 'package:flutter/material.dart';

import '../../../../../../core/language/lang_keys.dart';
import '../../../../../../core/style/color/app_color.dart';
import '../../../../../../core/style/statics/app_statics.dart';
import '../../../../../../core/style/widgets/app_space.dart';
import '../home_section_header.dart';
import 'home_companies_listview.dart';

class HomeCompaniesSection extends StatelessWidget {
  const HomeCompaniesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: AppBorderRadius.mediumRadius,
      ),
      height: 330,
      child: Column(
        spacing: 10,
        children: [
          AppSpace(space: 10),
          HomeSectionHeader(title: LangKeys.companies, onTap: () {}),
          HomeCompaniesListview(),
          AppSpace(space: 5),
        ],
      ),
    );
  }
}
