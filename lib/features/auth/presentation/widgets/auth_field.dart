import 'package:flutter/widgets.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:teamly/core/extextions/extentions.dart';
import 'package:teamly/core/style/widgets/app_text_form_felid.dart'
    show AppTextFormField;

import '../../../../core/language/lang_keys.dart';
import '../cubit/auth_cubit/auth_cubit.dart';

class AuthField extends StatelessWidget {
  const AuthField({super.key, required this.authCubit});

  final AuthCubit authCubit;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: authCubit.formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          spacing: 10,
          children: [
            AppTextFormField(
              controller: authCubit.emailController,
              type: TextInputType.emailAddress,
              hint: LangKeys.mailHint,
              label: LangKeys.email,
              prefix: Icon(HugeIcons.strokeRoundedMail02),
              validate: (c) {
                if (c!.isEmpty) {
                  return context.translate(LangKeys.requiredValue);
                } else if (!RegExp(
                  r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                ).hasMatch(c)) {
                  return context.translate(LangKeys.writeEmailCorrect);
                }
                return null;
              },
            ),
            AppTextFormField(
              controller: authCubit.passwordController,
              type: TextInputType.visiblePassword,
              label: LangKeys.password,
              isPassword: true,
              prefix: Icon(HugeIcons.strokeRoundedLockPassword),
              hint: LangKeys.passwordHint,
              validate: (c) {
                if (c!.isEmpty) {
                  return context.translate(LangKeys.requiredValue);
                } else if (c.length < 6) {
                  return context.translate(LangKeys.passwordLength);
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }
}
