import 'package:flutter/material.dart';

import '../../../../../../core/entities/custody_entity.dart';
import 'custody_item_web.dart';

class CustodyWebGridview extends StatelessWidget {
  const CustodyWebGridview({super.key, required this.custodyList});
  final List<CustodyEntity> custodyList;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: custodyList.length,
      itemBuilder: (context, index) {
        final custody = custodyList[index];
        return CustodyItemWeb(custody: custody);
      },
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 400,
        childAspectRatio: 16 / 10,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
