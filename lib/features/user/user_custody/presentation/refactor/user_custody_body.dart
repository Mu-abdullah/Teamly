import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/style/color/app_color.dart';
import '../../../../../core/style/widgets/app_text.dart';
import '../../../../../core/style/widgets/custom_shimmer.dart';
import '../cubits/user_custody_cubit/user_custody_cubit.dart';
import '../widgets/custody_loading_shimmer.dart';
import '../widgets/user_custody_listview.dart';

class UserCustodyScreenBody extends StatelessWidget {
  const UserCustodyScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCustodyCubit, UserCustodyState>(
      builder: (context, state) {
        if (state is UserCustodyLoading) {
          return LoadingShimmer();
        } else if (state is UserCustodyLoaded) {
          return UserCustodyLisView(list: state.userCustodyList);
        } else if (state is UserCustodyError) {
          return Center(
            child: AppText(state.message, translate: false, maxLines: 5),
          );
        } else {
          return CustomShimmer(
            child: Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(24),
              ),
            ),
          );
        }
      },
    );
  }
}
