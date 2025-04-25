import 'package:flutter/material.dart';

import '../../../../core/language/lang_keys.dart' show LangKeys;
import '../../../../core/style/widgets/app_button.dart';
import '../cubit/auth_cubit/auth_cubit.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({super.key, required this.authCubit});

  final AuthCubit authCubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: AppButton(
        onTap: () {
          if (authCubit.formKey.currentState!.validate()) {}
        },
        text: LangKeys.login,
      ),
    );
  }
}
