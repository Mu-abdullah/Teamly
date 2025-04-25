import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teamly/core/extextions/extentions.dart';

import '../../../../core/routes/routes_name.dart';
import '../../../../core/style/color/app_color.dart';
import '../../../../core/style/widgets/custom_snack_bar.dart';
import '../../../admin/home_screen/presentation/widgets/co_name_logo/co_name_logo.dart';
import '../cubit/auth_cubit/auth_cubit.dart';
import '../widgets/auth_button.dart';
import '../widgets/auth_field.dart';
import '../widgets/welcome_user.dart';

class AuthBody extends StatelessWidget {
  const AuthBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: _authListener,
      builder: (context, state) {
        var authCubit = AuthCubit.get(context);
        return SingleChildScrollView(
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

  void _authListener(BuildContext context, state) {
    if (state is AuthInitial) {
      CustomSnackbar.showTopSnackBar(
        context,
        message: 'Welcome to Teamly',
        translate: false,
        backgroundColor: AppColors.blueAccent,
      );
    }
    if (state is AuthError) {
      CustomSnackbar.showTopSnackBar(
        context,
        message: state.message,
        translate: false,
        backgroundColor: AppColors.red,
      );
    } else if (state is AuthSuccess) {
      CustomSnackbar.showTopSnackBar(
        context,
        message: 'Login successful',
        translate: false,
        backgroundColor: AppColors.green,
      );
      context.pushNamed(
        RoutesNames.checkRole,
        arguments: {'mail': context.read<AuthCubit>().emailController.text},
      );
    } else if (state is AuthLoading) {
      CustomSnackbar.showTopSnackBar(
        context,
        message: 'Loading...',
        backgroundColor: AppColors.yellow,
        translate: false,
      );
    } else if (state is UserNotFound) {
      CustomSnackbar.showTopSnackBar(
        context,
        message: state.message,
        translate: false,
        backgroundColor: AppColors.red,
      );
    }
  }
}
