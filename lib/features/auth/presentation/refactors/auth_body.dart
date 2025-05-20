import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teamly/core/extextions/extentions.dart';

import '../../../../core/language/lang_keys.dart';
import '../../../../core/routes/routes_name.dart';
import '../../../../core/style/color/app_color.dart';
import '../../../../core/style/widgets/custom_snack_bar.dart';
import '../cubit/auth_cubit/auth_cubit.dart';
import 'mobile_auth_body.dart';
import 'web_auth_body.dart';

class AuthBody extends StatelessWidget {
  const AuthBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: _authListener,
      builder: (context, state) {
        var authCubit = AuthCubit.get(context);
        return LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 600) {
              return MobileAuthBody(authCubit: authCubit);
            } else {
              return WebAuthBody(
                authCubit: authCubit,
                constraints: constraints.maxWidth,
              );
            }
          },
        );
      },
    );
  }

  void _authListener(BuildContext context, state) {
    if (state is AuthError) {
      CustomSnackbar.showTopSnackBar(
        context,
        message: state.message,
        translate: false,
        backgroundColor: AppColors.red,
      );
    } else if (state is AuthSuccess) {
      context.read<AuthCubit>().saveMe();
      context.pushNamed(
        RoutesNames.checkRole,
        arguments: {'mail': context.read<AuthCubit>().emailController.text},
      );
      CustomSnackbar.showTopSnackBar(
        context,
        message: LangKeys.loginSuccess,
        translate: false,
        backgroundColor: AppColors.green,
      );
    } else if (state is AuthLoading) {
      CustomSnackbar.showTopSnackBar(
        context,
        message: LangKeys.loading,
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
