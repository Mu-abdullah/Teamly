import 'package:flutter/material.dart';

import '../../../admin/home_screen/presentation/widgets/co_name_logo/co_name_logo.dart';
import '../cubit/auth_cubit/auth_cubit.dart';
import '../widgets/auth_button.dart';
import '../widgets/auth_field.dart';
import '../widgets/remmber_me_check_box.dart';
import '../widgets/welcome_user.dart';

class WebAuthBody extends StatelessWidget {
  const WebAuthBody({
    super.key,
    required this.authCubit,
    required this.constraints,
  });

  final AuthCubit authCubit;
  final double constraints;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: constraints / 2,
        child: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CoNameLogo(),
            WelcomeUser(),
            AuthField(authCubit: authCubit),
            AuthButton(authCubit: authCubit),
            RemmberCheckBox(),
          ],
        ),
      ),
    );
  }
}