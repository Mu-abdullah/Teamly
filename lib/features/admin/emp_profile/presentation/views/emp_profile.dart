import 'package:flutter/material.dart';

import '../../../../../core/style/widgets/custom_app_bar.dart';
import '../refactor/mobile_emp_profile.dart';

class EmpProfile extends StatelessWidget {
  const EmpProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Employee Profile', translate: false),
      body: MobileEmpProfile(),
    );
  }
}
