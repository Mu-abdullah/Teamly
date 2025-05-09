import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:teamly/core/extextions/extentions.dart';

import '../../../../../core/routes/routes_name.dart';
import '../../../../../core/services/status/custody_status.dart';
import '../../../../../core/style/color/app_color.dart';
import '../../../../../core/style/widgets/app_button.dart';
import '../cubits/get_custody_transaction_cubit/get_custody_transaction_cubit.dart';
import '../cubits/settled_custody_cubit/settled_custody_cubit.dart';

class SatteledButton extends StatelessWidget {
  const SatteledButton({
    super.key,
    required this.isNotSatteled,
    required this.cubit,
  });

  final bool isNotSatteled;
  final GetCustodyTransactionCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettledCustodyCubit, SettledCustodyState>(
      builder: (context, state) {
        var custodyCubit = SettledCustodyCubit.get(context);
        return AppButton(
          isCircle: true,
          icon:
              isNotSatteled
                  ? HugeIcons.strokeRoundedLoading01
                  : Icons.handshake_outlined,
          backGroungColor: isNotSatteled ? AppColors.orange : AppColors.green,
          onTap: () {
            if (isNotSatteled) {
              custodyCubit
                  .updateCustodyStatus(
                    id: cubit.custody.id!,
                    status: CustodyStatus.settled,
                  )
                  .then((onValue) {
                    if (context.mounted) {
                      context.pushNamedAndRemoveUntil(RoutesNames.homeScreen);
                    }
                  });
            }
          },
        );
      },
    );
  }
}
