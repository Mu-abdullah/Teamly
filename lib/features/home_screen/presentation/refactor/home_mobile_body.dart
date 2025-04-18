import 'package:flutter/material.dart';

import '../widgets/co_name_logo/co_name_logo.dart';
import '../widgets/emp_count/home_emp_count.dart';
import '../widgets/home_emp/home_emp.dart';

class HomeMobileBody extends StatelessWidget {
  const HomeMobileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CoNameLogo(),
          HomeEmpCount(),
          SizedBox(height: 20),
          MobileHomeEmp(),
        ],
      ),
    );
  }
}
