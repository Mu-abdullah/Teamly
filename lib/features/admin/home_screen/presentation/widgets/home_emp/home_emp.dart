import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/language/lang_keys.dart';
import '../../../../../../core/style/color/app_color.dart';
import '../../../../../../core/style/statics/app_statics.dart';
import '../../../../../../core/style/widgets/app_space.dart';
import '../../../../../../core/style/widgets/app_text.dart';
import '../../../../custody/custody_transaction/presentation/widgets/add_custody/emp_shimmer.dart';
import '../../cubits/home_emp_cubit/home_emp_cubit.dart';
import '../home_section_header.dart';
import 'home_emp_listview.dart';

class HomeEmpSection extends StatelessWidget {
  const HomeEmpSection({super.key, this.height = 250});
  final double height;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeEmpCubit, HomeEmpState>(
      builder: (context, state) {
        if (state is EmpLoading) {
          return EmpShimmer(height: height);
        } else if (state is EmpSuccess) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: AppBorderRadius.mediumRadius,
              color: AppColors.white,
            ),

            height: height,
            child: Column(
              spacing: 5,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppSpace(space: 10),
                HomeSectionHeader(title: LangKeys.employees, onTap: () {}),
                HomeEmpListview(empList: state.empList),
              ],
            ),
          );
        } else if (state is EmpError) {
          return Center(child: AppText(state.error));
        }
        return Container(
          height: height,
          decoration: BoxDecoration(
            borderRadius: AppBorderRadius.mediumRadius,
            color: AppColors.white,
          ),
          child: Center(child: AppText(LangKeys.noDataFound)),
        );
      },
    );
  }
}
