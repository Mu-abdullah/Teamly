import 'package:flutter/material.dart';

import '../../../data/model/user_requests_vacations.dart';
import 'user_vacations_requests_item.dart';

class UserVacationListview extends StatelessWidget {
  const UserVacationListview({super.key, required this.requests});
  final List<UserRequestsVacations> requests;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: requests.length,
      itemBuilder: (context, index) {
        var request = requests[index];
        return UserVacationRequestItem(request: request);
      },
    );
  }
}
