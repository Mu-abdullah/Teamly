import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_user_state.dart';

class AppUserCubit extends Cubit<AppUserState> {
  // final AppUserRepo repo;
  AppUserCubit() : super(UserInitial()) {
    //  getUser();
  }

  static AppUserCubit get(context) => BlocProvider.of(context);

  // UserModel? user;

  // Future<void> getUser() async {
  //   emit(UserLoading());
  //   var response = await repo.getCurrentUser();
  //   response.fold((error) => emit(UserError(message: error.message)), (
  //     userData,
  //   ) {
  //     if (userData != null) {
  //       user = userData;
  //       emit(UserLoggedIn(user: userData));
  //     } else {
  //       user = null;
  //       emit(UserNotLoggedIn());
  //     }
  //   });
  // }

  // Future<void> setUser(UserModel user) async {
  //   await repo.saveUser(user);
  //   this.user = user;
  //   emit(UserLoggedIn(user: user));
  // }

  // Future<void> logOut() async {
  //   await repo.logOut();
  //   user = null;
  //   emit(UserNotLoggedIn());
  // }

  // Future<void> updateUser(UserModel updatedUser) async {
  //   await repo.saveUser(updatedUser);
  //   user = updatedUser;
  //   emit(UserLoggedIn(user: updatedUser));
  // }
}
