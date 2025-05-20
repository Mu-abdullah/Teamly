import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/language/lang_keys.dart';
import '../../../../../../../core/style/widgets/app_text.dart';
import '../../../../../../../core/style/widgets/custom_drop_menu.dart';
import '../../../data/model/custody_emp_model.dart';
import '../../cubits/add_custody_transaction_cubit/add_custody_transaction_cubit.dart';
import '../../cubits/emp_custody_transaction_cubit/emp_custody_transaction_cubit.dart';
import 'emp_shimmer.dart';

class ChooseEmpDropMenu extends StatelessWidget {
  const ChooseEmpDropMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmpCustodyTransactionCubit, EmpCustodyTransactionState>(
      builder: (context, state) {
        if (state is GetEmpLoading) {
          return EmpShimmer();
        } else if (state is GetEmpError) {
          return Center(child: AppText(LangKeys.error));
        } else if (state is GetEmpLoaded) {
          return Column(
            children: [
              GenericDropdown(
                items: state.empList,
                getDisplayText: (CustodyEmpModel emp) => emp.name!,
                onChanged: (c) {
                  if (c != null) {
                    context.read<AddCustodyTransactionCubit>().empId = c.id!;
                    debugPrint(c.id.toString());
                  }
                },
                hint: LangKeys.chooseEmployee,
              ),
            ],
          );
        }
        return Container();
      },
    );
  }
}
