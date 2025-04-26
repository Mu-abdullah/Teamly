import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../auth/data/models/emp_model.dart';
import '../../../data/repo/user_profile_repo.dart';

part 'user_profile_state.dart';

class UserProfileCubit extends Cubit<UserProfileState> {
  UserProfileRepo repo;
  UserProfileCubit(this.repo) : super(UserProfileInitial()) {
    getUserProfile();
  }

  static UserProfileCubit get(context) => BlocProvider.of(context);

  Future<void> getUserProfile() async {
    emit(UserProfileLoading());
    final result = await repo.getUserProfile();
    result.fold(
      (error) {
        emit(UserProfileError(error.message));
      },
      (user) {
        final emp = EmpModel.fromJson(user);
        emit(UserProfileLoaded(emp));
      },
    );
  }
}
