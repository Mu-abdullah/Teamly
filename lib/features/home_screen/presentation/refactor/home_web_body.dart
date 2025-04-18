import 'package:flutter/material.dart';

import '../widgets/co_name_logo/co_name_logo.dart';
import '../widgets/emp_count/home_emp_count.dart';
import '../widgets/home_comp/home_companies.dart';
import '../widgets/home_emp/home_emp.dart';

class HomeWebBody extends StatelessWidget {
  const HomeWebBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: 10,
        children: [
          CoNameLogo(),
          Row(
            spacing: 10,
            children: [
              Expanded(child: HomeEmpCount()),
              Expanded(child: HomeCompaniesSection()),
            ],
          ),
          Row(
            spacing: 10,
            children: [
              Expanded(child: HomeEmpSection()),
              Expanded(child: SizedBox()),
            ],
          ),
        ],
      ),
    );
  }
}
