import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/language/lang_keys.dart';
import '../../../../core/services/get_it/git_it.dart';
import '../../../../core/style/widgets/custom_app_bar.dart';
import '../../data/repo/auth_repo.dart';
import '../cubit/auth_cubit/auth_cubit.dart';
import '../refactors/auth_body.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var lactor = locator<AuthRepo>();
    return BlocProvider(
      create: (context) => AuthCubit(lactor),
      child: Scaffold(
        appBar: CustomAppBar(title: LangKeys.login, isBack: false),
        body: AuthBody(),
      ),
    );
  }
}
