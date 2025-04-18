import 'package:flutter/material.dart';

import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/style/widgets/custom_app_bar.dart';
import '../refactor/home_body.dart';
import '../widgets/drawer/home_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: LangKeys.home,
        isBack: false,
        hasDrawer: true,
      ),
      body: HomeBody(),
      drawer: CustomHomeDrawer(),
    );
  }
}

