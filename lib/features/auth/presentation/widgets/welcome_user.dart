import 'package:flutter/material.dart';
import 'package:teamly/core/extextions/extentions.dart';

import '../../../../core/language/lang_keys.dart';
import '../../../../core/style/widgets/app_text.dart';

class WelcomeUser extends StatelessWidget {
  const WelcomeUser({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: AppText(
        LangKeys.welcomeUser,
        fontSize: context.titleLarge!.fontSize,
        maxLines: 3,
        textAlign: TextAlign.start,
      ),
    );
  }
}