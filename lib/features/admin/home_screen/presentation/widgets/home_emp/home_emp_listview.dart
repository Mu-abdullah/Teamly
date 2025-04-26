import 'package:flutter/material.dart';

import '../../../data/model/home_emp_model.dart';
import 'home_emp_item.dart';

class HomeEmpListview extends StatelessWidget {
  const HomeEmpListview({super.key, required this.empList});
  final List<HomeEmpModel> empList;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: empList.length,
        itemBuilder: (context, index) {
          return HomeEmpItem(emp: empList[index]);
        },
      ),
    );
  }
}
