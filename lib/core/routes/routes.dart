import 'package:flutter/material.dart';

import '../../features/admin/admin_attendance/presentation/views/admin_attendance.dart';
import '../../features/admin/custody/data/model/custody_model.dart';
import '../../features/admin/custody_transaction/presentation/views/custody_transactions.dart';
import '../../features/admin/custody/presentation/views/custody_screen.dart';
import '../../features/admin/custody_transaction_items/presentation/views/custody_transaction_items.dart';
import '../../features/admin/emp_profile/presentation/views/emp_profile.dart';
import '../../features/admin/home_screen/presentation/views/home_screen.dart';
import '../../features/admin/review_vacation_requests/presentation/views/review_vacation_request.dart';
import '../../features/auth/presentation/views/auth_screen.dart';
import '../../features/auth/presentation/views/check_role.dart';
import '../../features/user/user_home/presentation/views/user_home.dart';
import '../../features/user/user_vaction/presentation/views/user_vacations.dart';
import '../../features/user/user_vaction/presentation/widgets/user_new_request_vacation/user_request_vacation.dart';
import '../../features/user/user_vaction/presentation/widgets/user_vacations_requests/user_vacations_requests.dart';
import '../app/image/image_preview.dart';
import '../app/language/language_screen.dart';
import '../app/no_internet/no_internet_screen.dart';
import 'base_routes.dart';
import 'routes_name.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  final args = settings.arguments as Map<String, dynamic>?;

  switch (settings.name) {
    ///////// basic routes
    case RoutesNames.imagePreview:
      return BaseRoute(
        page: PreviewImage(
          imageUrl: args?['imageUrl'] as String?,
          title: args?['title'] as String?,
          imagesList:
              (args?['imagesList'] as List?)?.whereType<String>().toList(),
        ),
      );

    case RoutesNames.language:
      return BaseRoute(page: LanguageScreen());

    case RoutesNames.noInternet:
      return BaseRoute(page: NoInternetScreen());

    case RoutesNames.auth:
      return BaseRoute(page: AuthScreen());

    case RoutesNames.checkRole:
      return BaseRoute(page: CheckRole(mail: args?['mail'] as String));

    /////////
    /////////admin feature routes////////////
    /////////

    case RoutesNames.homeScreen:
      return BaseRoute(page: const HomeScreen());

    case RoutesNames.empProfileScreen:
      return BaseRoute(page: EmpProfile(id: args?['id'] as String?));

    case RoutesNames.custodyScreen:
      return BaseRoute(page: const CustodyScreen());

    case RoutesNames.custodyTransactions:
      return BaseRoute(
        page: CustodyTransactions(
          model: args?['model'] as CustodyModel,
          
        ),
      );
    case RoutesNames.custodyTransactionsItems:
      return BaseRoute(
        page: CustodyTransactionItems(
          id: args?['id'] as String,
          custodyAmount: args?['custodyAmount'] as String,
        ),
      );

    case RoutesNames.adminAttendance:
      return BaseRoute(page: AdminAttendance());

    case RoutesNames.reviewVacationRequest:
      return BaseRoute(page: ReviewVacationRequest());

    /////////
    /////////user feature routes////////////
    /////////
    case RoutesNames.userHomeScreen:
      return BaseRoute(page: UserHome(isAdmin: args?['isAdmin'] ?? false));

    case RoutesNames.userVacation:
      return BaseRoute(page: UserVacations(gender: args?['gender'] as String));

    case RoutesNames.userNewVacationRequests:
      return BaseRoute(
        page: UserRequestVacation(gender: args?['gender'] as String),
      );

    case RoutesNames.userVacationsRequests:
      return BaseRoute(page: UserVacationsRequests());

    default:
      return BaseRoute(page: const MaterialApp());
  }
}
