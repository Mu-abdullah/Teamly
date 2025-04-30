import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/get_user_data_cubit/get_user_data_cubit.dart';
import '../user_card_loading.dart';
import 'home_user_info.dart';

class UserHomeCard extends StatelessWidget {
  const UserHomeCard({super.key, required this.isArabic});

  final bool isArabic;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserDataCubit, GetUserDataState>(
      builder: (context, state) {
        if (state is GetUserDataLoading) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: UserCardLoading(),
          );
        } else if (state is GetUserDataError) {
          return Center(child: Text(state.message));
        } else if (state is GetUserDataLoaded) {
          final user = state.user;
          return HomeUserInfo(isArabic: isArabic, user: user);
        } else {
          return const Center(child: Text('Something went wrong'));
        }
      },
    );
  }
}
