import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/app/user/app_user_cubit/app_user_cubit.dart';
import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/services/status/custody_status.dart';
import '../../../../../core/style/widgets/app_text.dart';
import '../../data/model/user_custody_model.dart';
import '../cubits/settaled_user_custody_cubit/settaled_user_custody_cubit.dart';
import '../cubits/user_custody_cubit/user_custody_cubit.dart';

class UserSettaledButton extends StatelessWidget {
  const UserSettaledButton({super.key, required this.item});

  final UserCustodyModel item;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettaledUserCustodyCubit, SettaledUserCustodyState>(
      builder: (context, state) {
        var c = SettaledUserCustodyCubit.get(context);
        return TextButton(
          onPressed: () {
            c
                .updateCustodyStatus(
                  status: CustodyStatus.settled,
                  id: item.id!,
                )
                .then((onValue) {
                  if (context.mounted) {
                    context.read<UserCustodyCubit>().getUserCustody(
                      uid: context.read<AppUserCubit>().empID,
                    );
                  }
                });
          },
          child: AppText(
            LangKeys.settlement,
            color: CustodyStatus.getStatusColor(item.status!),
          ),
        );
      },
    );
  }
}
