

// class AppUserRepo {
//   Future<Either<CustomError, UserModel?>> getCurrentUser() async {
//     try {
//       var isSignedIn =
//           await SharedPref.getData(key: PrefKeys.isSignedIn) ?? false;
//       if (isSignedIn) {
//         var userdata = await SharedPref.getUserFromPreferences(
//           key: PrefKeys.userModel,
//         );
//         if (userdata != null) {
//           return Right(UserModel.fromJson(userdata));
//         }
//       }
//       return Right(null); // Not logged in, no error
//     } catch (e) {
//       return Left(CustomError("Failed to retrieve user data: ${e.toString()}"));
//     }
//   }

//   Future<void> saveUser(UserModel user) async {
//     await SharedPref.saveUserToPreferences(
//       key: PrefKeys.userModel,
//       user: user.toJson(),
//     );
//     await SharedPref.saveData(key: PrefKeys.isSignedIn, value: true);
//   }

//   Future<void> logOut() async {
//     await SharedPref.removeData(key: PrefKeys.isSignedIn);
//     await SharedPref.removeData(key: PrefKeys.userModel);
//   }

//   Future<bool> isUserSignedIn() async {
//     return await SharedPref.getData(key: PrefKeys.isSignedIn) ?? false;
//   }
// }
