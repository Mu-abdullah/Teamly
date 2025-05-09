import 'package:flutter/material.dart';

import '../../data/model/user_get_custody_item_model.dart';
import 'user_custody_item_listview_item.dart';

class UserCustodyItemListview extends StatelessWidget {
  const UserCustodyItemListview({super.key, required this.items});
  final List<UserGetCustodyItemModel> items;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return UserCustodyItemListviewItem(items: items[index]);
      },
    );
  }
}
