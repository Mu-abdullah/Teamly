import 'package:flutter/material.dart';

import 'home_mobile_body.dart';
import 'home_web_body.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return const HomeMobileBody();
        } else {
          return const HomeWebBody();
        }
      },
    );
  }
}
