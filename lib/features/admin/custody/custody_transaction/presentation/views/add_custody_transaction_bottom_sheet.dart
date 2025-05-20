import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/app/user/app_user_cubit/app_user_cubit.dart';
import '../../../../../../core/services/get_it/git_it.dart';
import '../../data/repo/add_custody_transaction_repo.dart';
import '../../data/repo/emp_custody_transaction_repo.dart';
import '../cubits/add_custody_transaction_cubit/add_custody_transaction_cubit.dart';
import '../cubits/emp_custody_transaction_cubit/emp_custody_transaction_cubit.dart';
import '../refactor/add_custody_transaction_bottom_sheet_body.dart';

class AddCustodyTranactionBottomSheet extends StatelessWidget {
  const AddCustodyTranactionBottomSheet({
    super.key,

    required this.id,
    required this.rimingAmount,
    this.onTransactionAdded,
  });
  final String id;
  final VoidCallback? onTransactionAdded;
  final String rimingAmount;
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
        BlocProvider(
          create:
              (context) =>
                  AddCustodyTransactionCubit(add, rimingAmount: rimingAmount),
        ),
      ],
      child: AddCustodyTranactionBottomSheetBody(
        id: id,
        compId: compId,
        onTransactionAdded: onTransactionAdded,
      ),
    );
  }
}
