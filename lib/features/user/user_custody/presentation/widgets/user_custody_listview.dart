import 'package:flutter/material.dart';

import '../../data/model/user_custody_model.dart';
import 'user_custody_item.dart';

class UserCustodyLisView extends StatelessWidget {
  const UserCustodyLisView({super.key, required this.list});
  final List<UserCustodyModel> list;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return UserCustodyItem(item: list[index]);
      },
    );
  }
}
