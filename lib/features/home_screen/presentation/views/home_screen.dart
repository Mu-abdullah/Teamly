import 'package:flutter/material.dart';

import '../../../../core/language/lang_keys.dart';
import '../../../../core/style/widgets/custom_app_bar.dart';
import '../refactor/home_mobile_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(translatedTitle: LangKeys.home, isBack: false),
      body: HomeMobileBody(),
    );
  }
}
