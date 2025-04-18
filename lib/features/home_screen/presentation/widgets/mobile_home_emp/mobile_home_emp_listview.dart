import 'package:flutter/material.dart';

import 'mobile_home_emp_item.dart';

class MobileHomeEmpListview extends StatelessWidget {
  const MobileHomeEmpListview({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return MobileHomeEmpItem();
        },
      ),
    );
  }
}
