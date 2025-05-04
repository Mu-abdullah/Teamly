import 'package:flutter/material.dart';

import '../../../data/model/custody_model.dart';
import 'custody_item.dart';

class CustodyListView extends StatelessWidget {
  final List<CustodyModel> custodyList;

  const CustodyListView({super.key, required this.custodyList});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      itemCount: custodyList.length,
      separatorBuilder: (_, __) => const Divider(height: 1),
      itemBuilder: (context, index) => CustodyItem(custody: custodyList[index]),
    );
  }
}
