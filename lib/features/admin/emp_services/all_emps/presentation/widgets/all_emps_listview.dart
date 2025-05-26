import 'package:flutter/material.dart';

import '../../data/model/all_emp_model.dart';
import 'all_emps_item.dart';

class AllEmpsListView extends StatelessWidget {
  const AllEmpsListView({super.key, required this.empList});
  final List<AllEmpModel> empList;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: empList.length,
      itemBuilder: (context, index) {
        final emp = empList[index];
        return AllEmpsItem(emp: emp);
      },
    );
  }
}
