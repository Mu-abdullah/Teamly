import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:teamly/core/extextions/extentions.dart';

import '../../../../../core/functions/timestamp_to_time.dart';
import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/style/color/app_color.dart';
import '../../data/model/user_get_custody_item_model.dart';
import 'user_custody_card_info.dart';

class UserCustodyItemListviewItem extends StatelessWidget {
  const UserCustodyItemListviewItem({super.key, required this.items});

  final UserGetCustodyItemModel items;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.blueAccent.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          UserCustodyItemCardInfo(
            icon: HugeIcons.strokeRoundedCalendar01,
            lable: LangKeys.createdAt,
            value: TimeRefactor(items.createdAt!).toDateString(),
          ),

          UserCustodyItemCardInfo(
            icon: HugeIcons.strokeRoundedInformationCircle,
            lable: LangKeys.custodyDetails,
            value: items.name!,
          ),
          UserCustodyItemCardInfo(
            icon: HugeIcons.strokeRoundedRightToLeftListNumber,
            lable: LangKeys.itemCount,
            value: items.count!,
          ),
          UserCustodyItemCardInfo(
            icon: HugeIcons.strokeRoundedDollar01,
            lable: LangKeys.itemPrice,
            value: "${items.price} ${context.translate(LangKeys.eg)}",
          ),
          UserCustodyItemCardInfo(
            icon: HugeIcons.strokeRoundedDollarSend01,
            lable: LangKeys.totalPrice,
            value: "${items.totalPrice} ${context.translate(LangKeys.eg)}",
          ),
        ],
      ),
    );
  }
}
