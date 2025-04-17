import 'package:flutter/material.dart';
import 'package:teamly/core/extextions/extentions.dart';

import '../../../../core/language/lang_keys.dart';
import '../../../../core/style/widgets/app_text.dart';
import '../../../../core/style/widgets/custom_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(translatedTitle: LangKeys.home, isBack: false),
      body: Column(
        children: [Center(child: AppText(context.translate(LangKeys.home)))],
      ),
    );
  }
}
