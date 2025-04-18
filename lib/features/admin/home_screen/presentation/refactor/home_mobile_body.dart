import 'package:flutter/material.dart';

import '../../../../../core/style/widgets/app_space.dart';
import '../widgets/co_name_logo/co_name_logo.dart';
import '../widgets/emp_count/home_emp_count.dart';
import '../widgets/home_comp/home_companies.dart';
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
          HomeEmpCount(),
          HomeCompaniesSection(),
          HomeEmpSection(),
          AppSpace(space: 10),
        ],
      ),
    );
  }
}
