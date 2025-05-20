
import 'package:flutter/material.dart';

import '../../../admin/home_screen/presentation/widgets/co_name_logo/co_name_logo.dart';
import '../cubit/auth_cubit/auth_cubit.dart';
import '../widgets/auth_button.dart';
import '../widgets/auth_field.dart';
import '../widgets/remmber_me_check_box.dart';
import '../widgets/welcome_user.dart';

class MobileAuthBody extends StatelessWidget {
  const MobileAuthBody({super.key, required this.authCubit});

  final AuthCubit authCubit;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CoNameLogo(),
          WelcomeUser(),
          AuthField(authCubit: authCubit),
          AuthButton(authCubit: authCubit),
          RemmberCheckBox(),
        ],
      ),
    );
  }
}
