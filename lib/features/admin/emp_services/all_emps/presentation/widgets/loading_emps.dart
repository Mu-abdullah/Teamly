import 'package:flutter/material.dart';

import '../../../../custody/custody_transaction/presentation/widgets/add_custody/emp_shimmer.dart';

class LoadingEmps extends StatelessWidget {
  const LoadingEmps({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: const EmpShimmer(height: 100),
        );
      },
    );
  }
}
