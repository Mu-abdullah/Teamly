import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teamly/core/extextions/extentions.dart';

import '../../../../../../core/app/user/app_user_cubit/app_user_cubit.dart';
import '../../../../../../core/functions/generate_id.dart';
import '../../../../../../core/language/lang_keys.dart';
import '../../../../../../core/services/supabase/backend_points.dart';
import '../../../../../../core/style/color/app_color.dart';
import '../../../../../../core/style/widgets/app_button.dart';
import '../../../../../../core/style/widgets/app_text_form_felid.dart';
import '../../../../../../core/style/widgets/custom_snack_bar.dart';
import '../../../data/model/custody_transaction_model.dart';
import '../../cubits/add_custody_transaction_cubit/add_custody_transaction_cubit.dart';

class CustodyTransactionAmount extends StatelessWidget {
  const CustodyTransactionAmount({
    super.key,
    required this.amount,
    required this.id,
    required this.compId,
  });

  final String amount;
  final String id;
  final String compId;

  @override
  Widget build(BuildContext context) {
    final userId = context.read<AppUserCubit>().userID;
    return BlocConsumer<AddCustodyTransactionCubit, AddCustodyTransactionState>(
      listener: _handleStateChanges,
      builder: (context, state) {
        final cubit = AddCustodyTransactionCubit.get(context);
        return _buildForm(context, cubit, state, userId);
      },
    );
  }

  void _handleStateChanges(
    BuildContext context,
    AddCustodyTransactionState state,
  ) {
    if (state is AddCustodyTransactionError) {
      _showErrorSnackbar(context, state.message);
    } else if (state is AddCustodyTransactionLoaded) {
      Navigator.pop(context);
    }
  }

  Widget _buildForm(
    BuildContext context,
    AddCustodyTransactionCubit cubit,
    AddCustodyTransactionState state,
    String userId,
  ) {
    return Form(
      key: cubit.formKey,
      child: Column(
        spacing: 16,
        children: [
          _buildAmountField(context, cubit),
          _buildSubmitButton(context, cubit, state, userId),
        ],
      ),
    );
  }

  Widget _buildAmountField(
    BuildContext context,
    AddCustodyTransactionCubit cubit,
  ) {
    return AppTextFormField(
      controller: cubit.transactionAmount,
      type: TextInputType.number,
      validate: (value) => _validateAmountInput(value, context),
      hint: LangKeys.custodyAmount,
      label: LangKeys.custodyAmount,
    );
  }

  Widget _buildSubmitButton(
    BuildContext context,
    AddCustodyTransactionCubit cubit,
    AddCustodyTransactionState state,
    String userId,
  ) {
    return AppButton(
      onTap: () => _handleSubmission(context, cubit, userId),
      isLoading: state is AddCustodyTransactionLoading,
      text: LangKeys.addCustody,
    );
  }

  String? _validateAmountInput(String? value, BuildContext context) {
    if (value?.isEmpty ?? true) {
      return context.translate(LangKeys.requiredValue);
    }

    final enteredAmount = double.tryParse(value!) ?? 0;
    final availableAmount = double.tryParse(amount) ?? 0;

    if (enteredAmount > availableAmount) {
      return context.translate(
        LangKeys.custodyTransactionAmountBigThanCustodyAmount,
      );
    }

    return null;
  }

  void _handleSubmission(
    BuildContext context,
    AddCustodyTransactionCubit cubit,
    String userId,
  ) {
    if (!cubit.formKey.currentState!.validate()) return;

    if (cubit.empId == null) {
      _showErrorSnackbar(context, LangKeys.chooseEmployee);
      return;
    }

    _submitTransaction(context, cubit, userId);
  }

  void _submitTransaction(
    BuildContext context,
    AddCustodyTransactionCubit cubit,
    String userId,
  ) {
    final transaction = CustodyTransactionModel(
      id: GenerateId.generateDocumentId(
        context: context,
        tableName: BackendPoint.custodyTransaction,
        companyName: compId,
      ),
      createdAt: DateTime.now().toString(),
      amount: cubit.transactionAmount.text,
      custodyId: id,
      empId: cubit.empId!,
      userId: userId,
    );

    debugPrint("Transaction data: ${transaction.toJson()}");
    cubit.addCustody(data: transaction);
  }

  void _showErrorSnackbar(BuildContext context, String messageKey) {
    CustomSnackbar.showTopSnackBar(
      context,
      backgroundColor: AppColors.red,
      message: messageKey,
    );
  }
}
