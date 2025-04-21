import 'package:flutter/material.dart';

import '../../../../../../core/entities/custody_entity.dart';
import 'custody_item.dart';

class CustodyListview extends StatelessWidget {
  const CustodyListview({super.key, required this.custodyList});
  final List<CustodyEntity> custodyList;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: custodyList.length,
      separatorBuilder: (_, __) => const Divider(),
      itemBuilder: (context, index) {
        final custody = custodyList[index];
        return CustodyItem(custody: custody);
      },
    );
  }
}
