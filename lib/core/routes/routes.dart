import 'package:flutter/material.dart';

import '../../features/admin/custody/presentation/views/custody_screen.dart';
import '../../features/admin/emp_profile/presentation/views/emp_profile.dart';
import '../../features/admin/home_screen/presentation/views/home_screen.dart';
import '../../features/user/user_home/presentation/views/user_home.dart';
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

    /////////
    /////////admin feature routes////////////
    /////////

    case RoutesNames.homeScreen:
      return BaseRoute(page: const HomeScreen());

    case RoutesNames.empProfileScreen:
      return BaseRoute(page: const EmpProfile());
      
    case RoutesNames.custodyScreen:
      return BaseRoute(page: const CustodyScreen());

    /////////
    /////////user feature routes////////////
    /////////
    case RoutesNames.userHomeScreen:
      return BaseRoute(page: const UserHome());

    default:
      return BaseRoute(page: const MaterialApp());
  }
}
