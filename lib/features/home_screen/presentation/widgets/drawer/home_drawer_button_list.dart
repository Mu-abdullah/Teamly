import 'package:flutter/material.dart';

import '../../../data/drawer_button_list.dart';
import 'drawer_item.dart';

class DrawerButtonList extends StatelessWidget {
  const DrawerButtonList({super.key});

  @override
  Widget build(BuildContext context) {
    final items = DrawerButtonListItems.drawerItems(context);
    return Expanded(
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: items.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          return DrawerItem(item: items[index]);
        },
      ),
    );
  }
}


