import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/app/user/app_user_cubit/app_user_cubit.dart';
import 'user_info.dart';

class UserHomeCard extends StatelessWidget {
  const UserHomeCard({super.key, required this.isArabic});

  final bool isArabic;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppUserCubit, AppUserState>(
      builder: (context, state) {
        if (state is UserProfileLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is UserProfileError) {
          return Center(child: Text(state.message));
        } else if (state is UserProfileLoaded) {
          final user = state.user;
          return UserInfo(isArabic: isArabic, user: user);
        } else {
          return const Center(child: Text('Something went wrong'));
        }
      },
    );
  }
}
