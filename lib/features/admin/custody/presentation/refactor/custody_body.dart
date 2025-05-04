import 'package:flutter/material.dart';

import 'mobile_custody_body.dart';
import 'web_custody_body.dart';

class CustodyBody extends StatelessWidget {
  const CustodyBody({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return constraints.maxWidth < 600
            ? const MobileCustodyBody()
            : const WebCustodyBody();
      },
    );
  }
}