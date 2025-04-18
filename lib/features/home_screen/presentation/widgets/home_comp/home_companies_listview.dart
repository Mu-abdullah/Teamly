import 'package:flutter/material.dart';

import 'home_companies_item.dart';

class HomeCompaniesListview extends StatelessWidget {
  const HomeCompaniesListview({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 15,
        itemBuilder: (context, index) {
          return HomeCompaniesItem(index: index);
        },
      ),
    );
  }
}
