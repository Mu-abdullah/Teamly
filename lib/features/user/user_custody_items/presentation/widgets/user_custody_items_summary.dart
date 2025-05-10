import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:teamly/core/extextions/extentions.dart';

import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/style/color/app_color.dart';
import '../../data/model/user_get_custody_item_model.dart';
import '../cubits/get_user_custody_items_cubit/get_user_custody_items_cubit.dart';
import 'user_custody_card_info.dart';

class UserCustodyItemsSummary extends StatelessWidget {
  const UserCustodyItemsSummary({
    super.key,
    required this.items,
    required this.height,
  });

  final List<UserGetCustodyItemModel> items;
  final double height;
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<GetUserCustodyItemsCubit>();
    return Container(
      height: height,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: AppColors.grey.withValues(alpha: 0.1),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
        child: Column(
          spacing: 10,
          children: [
            UserCustodyItemCardInfo(
              icon: HugeIcons.strokeRoundedDollar01,
              value: cubit.sumAllCount(items).toString(),
              lable: LangKeys.totalQuantity,
            ),
            UserCustodyItemCardInfo(
              icon: HugeIcons.strokeRoundedDollar01,
              value:
                  "${cubit.sumAllPrice(items)} ${context.translate(LangKeys.eg)}",
              lable: LangKeys.totalPrice,
            ),
            UserCustodyItemCardInfo(
              icon: HugeIcons.strokeRoundedDollar01,
              value:
                  "${cubit.calculateRemainingAmount()} ${context.translate(LangKeys.eg)}",
              lable: LangKeys.rimaining,
            ),
          ],
        ),
      ),
    );
  }
}
