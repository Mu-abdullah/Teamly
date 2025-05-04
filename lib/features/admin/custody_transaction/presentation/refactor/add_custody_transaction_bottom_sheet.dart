import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/app/user/app_user_cubit/app_user_cubit.dart';
import '../../../../../core/services/get_it/git_it.dart';
import '../../data/repo/add_custody_transaction_repo.dart';
import '../../data/repo/emp_custody_transaction_repo.dart';
import '../cubits/add_custody_transaction_cubit/add_custody_transaction_cubit.dart';
import '../cubits/emp_custody_transaction_cubit/emp_custody_transaction_cubit.dart';
import '../widgets/add_custody/choose_emp_drop_menu.dart';
import '../widgets/add_custody/custody_transaction_amount.dart';

class AddCustodyTranactionBottomSheet extends StatelessWidget {
  const AddCustodyTranactionBottomSheet({
    super.key,
    required this.amount,
    required this.id,
  });
  final String id;
  final String amount;
  @override
  Widget build(BuildContext context) {
    var compId = context.read<AppUserCubit>().compId;

    var add = locator<AddCustodyTransactionRepo>();
    var emp = locator<EmpCustodyTransactionRepo>();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) =>
                  EmpCustodyTransactionCubit(emp)..getEmp(compId: compId),
        ),
        BlocProvider(create: (context) => AddCustodyTransactionCubit(add)),
      ],
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: 16,
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom + 16,
          ),
          child: Column(
            spacing: 16,
            children: [
              ChooseEmpDropMenu(),
              CustodyTransactionAmount(amount: amount, id: id, compId: compId),
            ],
          ),
        ),
      ),
    );
  }
}
