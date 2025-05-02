import 'package:flutter/material.dart';

import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/style/widgets/custom_app_bar.dart';
import '../refactor/mobile_user_vaction_body.dart';

class UserVacations extends StatelessWidget {
  const UserVacations({super.key, required this.gender});
  final String gender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: LangKeys.vacation),
      body: MobileUserVactionsBody(gender: gender),
    );
  }
}

