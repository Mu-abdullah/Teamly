import 'package:flutter/material.dart';

import '../../../../../core/entities/custody_entity.dart';
import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/services/status/custody_status.dart';
import '../../../../../core/style/widgets/custom_app_bar.dart';
import '../widgets/custody_item.dart';

class CustodyScreen extends StatelessWidget {
  const CustodyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: LangKeys.custody),
      body: Column(
        children: [
          CustodyItem(
            custody: CustodyEntity(
              id: 1,
              name: 'Laptop Purchase',
              amount: "1999.99",
              status: CustodyStatus.settlement,
              approvedBy: 'mgr-789',
              createdAt: DateTime.now(),
            ),
          ),
        ],
      ),
    );
  }
}
