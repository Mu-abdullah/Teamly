import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/style/widgets/custom_app_bar.dart';
import '../../../../../core/style/widgets/custom_bottom_sheet.dart';
import '../views/add_custody_bottom_sheet.dart';

class CustodyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustodyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: LangKeys.custody,
      actions: [
        IconButton(
          icon: const Icon(HugeIcons.strokeRoundedAddCircle),
          onPressed: () {
            customShowBottomSheet(
              context: context,
              isScrollControlled: true,

              builder: (context) {
                return AddCustodyBottomSheet();
              },
            );
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
