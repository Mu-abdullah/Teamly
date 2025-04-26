import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../features/auth/data/models/emp_model.dart';
import '../../../services/shared_pref/pref_keys.dart';
import '../../../services/shared_pref/shared_pref.dart';
import '../repo/app_user_repo.dart';

part 'app_user_state.dart';

class AppUserCubit extends Cubit<AppUserState> {
  final AppUserRepo repo = AppUserRepo();
  AppUserCubit() : super(UserInitial()) {
    userId;
  }

  static AppUserCubit get(context) => BlocProvider.of(context);

  String get userId => SharedPref.getData(key: PrefKeys.userID);

  Future<void> logout() async {
    repo.logout();
    emit(UserLoggedOut());
  }
}
