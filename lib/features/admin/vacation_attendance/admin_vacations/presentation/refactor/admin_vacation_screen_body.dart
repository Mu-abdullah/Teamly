import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/style/widgets/app_text.dart';
import '../../../../home_screen/presentation/cubits/vacation_count_cubit/vacation_count_cubit.dart';
import '../widgets/admin_vacation_screen_items.dart';
import '../widgets/admin_vaction_screen_loading.dart';

class AdminVacationsScreenBody extends StatelessWidget {
  const AdminVacationsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VacationCountCubit, VacationCountState>(
      builder: (context, state) {
        var cubit = VacationCountCubit.get(context);
        if (state is VacationCountLoading) {
          return AdminVacationScreenLoading();
        } else if (state is VacationCountSuccess) {
          return AdminVacationScreenItems(cubit: cubit);
        } else if (state is VacationCountError) {
          return AppText(state.message, maxLines: 5);
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
