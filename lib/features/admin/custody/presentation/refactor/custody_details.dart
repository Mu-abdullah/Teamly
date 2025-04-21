import 'package:flutter/material.dart';

import '../../../../../core/entities/custody_entity.dart';
import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/style/widgets/custom_app_bar.dart';
import '../widgets/custody_item.dart';

class CustodyDetails extends StatelessWidget {
  const CustodyDetails({super.key, required this.custody});
  final CustodyEntity custody;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: LangKeys.custodyDetails),
      body: Column(
        children: [
          CustodyItem(custody: custody, showMore: false),
          const SizedBox(height: 20),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [],
            ),
          ),
        ],
      ),
    );
  }
}
