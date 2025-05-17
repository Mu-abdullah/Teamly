import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/style/widgets/app_text.dart';
import '../cubits/user_check_vacation_cubit/user_check_vacation_cubit.dart';
import '../widgets/user_vacation_gridview.dart';
import '../widgets/user_vacation_loading.dart';

class MobileUserVactionsBody extends StatelessWidget {
  const MobileUserVactionsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCheckVacationCubit, UserCheckVacationState>(
      builder: (context, state) {
        var cubit = UserCheckVacationCubit.get(context);
        if (state is UserCheckVacationLoading) {
          return UserVacationLoading();
        } else if (state is UserCheckVacationLoaded) {
          return VacationCardsGridView(cubit: cubit);
        } else if (state is UserCheckVacationError) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: AppText(state.error, translate: false, maxLines: 10),
            ),
          );
        }
        return Container();
      },
    );
  }
}
