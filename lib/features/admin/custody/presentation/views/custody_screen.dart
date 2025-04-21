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
              id: 'cust-123',
              name: 'Laptop Purchase',
              description: 'MacBook Pro for design team',
              amount: "1999.99",
              status: CustodyStatus.settlement,
              assignedTo: 'emp-456',
              approvedBy: 'mgr-789',
              createdAt: DateTime.now(),
            ),
          ),
        ],
      ),
    );
  }
}
