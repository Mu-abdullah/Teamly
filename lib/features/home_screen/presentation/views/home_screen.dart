import 'package:flutter/material.dart';

import '../../../../core/language/lang_keys.dart';
import '../../../../core/style/widgets/custom_app_bar.dart';
import '../widgets/emp_count/home_emp_count.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(translatedTitle: LangKeys.home, isBack: false),
      body: Column(
        children: [
          HomeEmpCount(),
        ],
      ),
    );
  }
}
