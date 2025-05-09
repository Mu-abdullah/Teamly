import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teamly/core/extextions/extentions.dart';

import '../../../../../core/functions/timestamp_to_time.dart';
import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/routes/routes_name.dart';
import '../../../../../core/style/color/app_color.dart';
import '../../../../../core/style/widgets/app_text.dart';
import '../../data/model/custody_transaction_model.dart';
import '../cubits/get_custody_transaction_cubit/get_custody_transaction_cubit.dart';

class CustodyTransactionItem extends StatelessWidget {
  const CustodyTransactionItem({super.key, required this.transaction});

  final CustodyTransactionModel transaction;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(
          RoutesNames.custodyTransactionsItems,
          arguments: {
            'id': transaction.id,
            'custodyAmount': transaction.amount,
            'superCustodyStatus':
                context.read<GetCustodyTransactionCubit>().custody.status,
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          padding: const EdgeInsets.all(12),
          child: Column(
                spacing: 5,
                children: [
                  Row(
                    spacing: 5,
                    children: [
                      AppText(
                        translate: false,
                        TimeRefactor(transaction.createdAt!).toDateString(),
                        fontSize: 10,
                      ),
                      Spacer(),
                      AppText(
                        translate: false,
                        transaction.amount!,
                        fontSize: 10,
                      ),
                      AppText(LangKeys.eg, fontSize: 10),
                    ],
                  ),
                  Row(
                    spacing: 5,
                    children: [
                      AppText(
                        LangKeys.name,
                        fontSize: 10,
                        color: AppColors.darkGrey,
                      ),
                      AppText(" : ", translate: false),
                      Expanded(
                        child: AppText(translate: false, transaction.empId!),
                      ),
                    ],
                  ),
                  Row(
                    spacing: 5,
                    children: [
                      AppText(
                        LangKeys.createdBy,
                        fontSize: 10,
                        color: AppColors.darkGrey,
                      ),
                      AppText(" : ", translate: false),
                      Expanded(
                        child: AppText(translate: false, transaction.userId!),
                      ),
                    ],
                  ),
                ],
              )
              .animate()
              .fadeIn(duration: 400.ms)
              .slideX(begin: 0.2, duration: 300.ms, curve: Curves.easeOut),
        ),
      ),
    );
  }
}
