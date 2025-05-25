import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/language/lang_keys.dart';
import '../../../../../../core/style/widgets/app_text.dart';
import '../../../../../../core/style/widgets/custom_drop_menu.dart';
import '../../../../custody/custody_transaction/presentation/widgets/add_custody/emp_shimmer.dart';
import '../cubits/exit_quantity_cubit/exit_quantity_cubit.dart';
import '../cubits/get_emps_cubit/get_emps_cubit.dart';

class ChooseEmpToWarehouseItem extends StatelessWidget {
  const ChooseEmpToWarehouseItem({super.key, required this.cubit});

  final ExitQuantityCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetEmpsCubit, GetEmpsState>(
      builder: (context, state) {
        if (state is GetEmpsLoading) {
          return EmpShimmer();
        } else if (state is GetEmpsLoaded) {
          return GenericDropdown(
            items: state.empList,
            getDisplayText: (state) => state.name!,
            onChanged: (state) {
              cubit.uid = state!.id!;
            },
            hint: LangKeys.chooseEmployee,
          );
        } else if (state is GetEmpsError) {
          return Center(child: AppText(state.error));
        }
        return const SizedBox();
      },
    );
  }
}
