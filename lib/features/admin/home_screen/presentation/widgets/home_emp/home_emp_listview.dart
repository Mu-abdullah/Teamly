import 'package:flutter/material.dart';

import 'home_emp_item.dart';

class HomeEmpListview extends StatelessWidget {
  const HomeEmpListview({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return HomeEmpItem();
        },
      ),
    );
  }
}
