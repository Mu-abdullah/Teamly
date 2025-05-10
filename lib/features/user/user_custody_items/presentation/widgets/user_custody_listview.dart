import 'package:flutter/material.dart';
import 'package:teamly/core/extextions/extentions.dart';

import '../../data/model/user_get_custody_item_model.dart';
import 'user_custody_item_listview_item.dart';
import 'user_custody_items_summary.dart';

class UserCustodyItemListview extends StatelessWidget {
  const UserCustodyItemListview({super.key, required this.items});
  final List<UserGetCustodyItemModel> items;
  @override
  Widget build(BuildContext context) {
    double height = 120;
    return SizedBox(
      height: context.height(),
      child: Stack(
        children: [
          UserCustodyItemsSummary(items: items, height: height),
          Positioned(
            top: height + 5,
            left: 0,
            right: 0,
            bottom: 0,
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return UserCustodyItemListviewItem(items: items[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
