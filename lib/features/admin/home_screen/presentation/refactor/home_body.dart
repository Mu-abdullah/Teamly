import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/app/user/app_user_cubit/app_user_cubit.dart';
import 'home_mobile_body.dart';
import 'home_web_body.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppUserCubit, AppUserState>(
      listener: (context, state) {},
      builder: (context, state) {
        return LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 600) {
              return const HomeMobileBody();
            } else {
              return const HomeWebBody();
            }
          },
        );
      },
    );
  }
}
