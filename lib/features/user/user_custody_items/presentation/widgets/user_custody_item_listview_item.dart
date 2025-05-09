import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:teamly/core/extextions/extentions.dart';

import '../../../../../core/functions/timestamp_to_time.dart';
import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/style/color/app_color.dart';
import '../../../../../core/style/widgets/app_text.dart';
import '../../data/model/user_get_custody_item_model.dart';

class UserCustodyItemListviewItem extends StatelessWidget {
  const UserCustodyItemListviewItem({super.key, required this.items});

  final UserGetCustodyItemModel items;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          buildItem(
            icon: HugeIcons.strokeRoundedCalendar01,
            lable: LangKeys.createdAt,
            value: TimeRefactor(items.createdAt!).toDateString(),
          ),

          buildItem(
            icon: HugeIcons.strokeRoundedInformationCircle,
            lable: LangKeys.custodyDetails,
            value: items.name!,
          ),
          buildItem(
            icon: HugeIcons.strokeRoundedRightToLeftListNumber,
            lable: LangKeys.itemCount,
            value: items.count!,
          ),
          buildItem(
            icon: HugeIcons.strokeRoundedDollar01,
            lable: LangKeys.itemPrice,
            value: "${items.price} ${context.translate(LangKeys.eg)}",
          ),
          buildItem(
            icon: HugeIcons.strokeRoundedDollarSend01,
            lable: LangKeys.totalPrice,
            value: "${items.totalPrice} ${context.translate(LangKeys.eg)}",
          ),
        ],
      ),
    );
  }

  Widget buildItem({
    required String lable,
    required String value,
    required IconData icon,
  }) {
    return Row(
      spacing: 10,
      children: [
        Icon(icon, color: AppColors.blueBlack),
        Expanded(
          flex: 1,
          child: AppText(
            lable,
            color: AppColors.grey,
            fontSize: 10,
            maxLines: 2,
          ),
        ),
        AppText(":", translate: false),
        Expanded(flex: 3, child: AppText(value, translate: false, maxLines: 5)),
      ],
    );
  }
}
