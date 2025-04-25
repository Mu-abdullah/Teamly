import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../admin/home_screen/presentation/widgets/co_name_logo/co_name_logo.dart';
import '../cubit/auth_cubit/auth_cubit.dart';
import '../widgets/auth_button.dart';
import '../widgets/auth_field.dart';
import '../widgets/welcome_user.dart';

class AuthBody extends StatelessWidget {
  const AuthBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        var authCubit = AuthCubit.get(context);
        return Center(
          child: Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CoNameLogo(),
              WelcomeUser(),
              AuthField(authCubit: authCubit),
              AuthButton(authCubit: authCubit),
            ],
          ),
        );
      },
    );
  }
}
