import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../widgets/header_sections.dart';
import '../widgets/transaction_items_list.dart';

class CustodyTransactionItemsBody extends StatelessWidget {
  const CustodyTransactionItemsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HeaderSection(),
        Expanded(
          child: TransactionItemsList()
              .animate()
              .fadeIn(duration: 400.ms)
              .slideX(begin: 0.2, duration: 300.ms, curve: Curves.easeOut),
        ),
      ],
    );
  }
}
