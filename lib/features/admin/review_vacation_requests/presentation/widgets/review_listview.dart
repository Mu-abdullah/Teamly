import 'package:flutter/material.dart';

import '../../data/model/review_vacation_model.dart';
import 'review_item.dart';

class ReviewListView extends StatelessWidget {
  const ReviewListView({super.key, required this.vacations});
  final List<ReviewVacationModel> vacations;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: vacations.length,
      itemBuilder: (context, index) {
        return ReviewItem(item: vacations[index]);
      },
    );
  }
}
