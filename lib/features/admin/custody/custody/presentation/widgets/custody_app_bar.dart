import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../../../core/language/lang_keys.dart';
import '../../../../../../core/style/widgets/custom_app_bar.dart';
import '../cubits/get_custody_cubit/get_custody_cubit.dart';
import '../views/add_custody_bottom_sheet.dart';

class CustodyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustodyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<GetCustodyCubit>();
    return CustomAppBar(
      title: LangKeys.custody,
      actions: [
        IconButton(
          icon: const Icon(HugeIcons.strokeRoundedAddCircle),
          onPressed: () {
            cubit.openBottomSheet(
              context: context,
              widget: AddCustodyBottomSheet(cubit: cubit),
            );
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
