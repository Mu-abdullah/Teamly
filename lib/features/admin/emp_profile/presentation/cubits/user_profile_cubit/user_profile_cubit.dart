import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../auth/data/models/emp_model.dart';
import '../../../data/repo/user_profile_repo.dart';

part 'user_profile_state.dart';

class UserProfileCubit extends Cubit<UserProfileState> {
  UserProfileRepo repo;
  UserProfileCubit(this.repo) : super(UserProfileInitial());

  static UserProfileCubit get(context) => BlocProvider.of(context);

  Future<void> getUserProfile(id) async {
    emit(UserProfileLoading());
    final result = await repo.getUserData(id);
    result.fold(
      (error) {
        if (!isClosed) {
          emit(UserProfileError(error.message));
        }
      },
      (user) {
        if (!isClosed) {
          emit(UserProfileLoaded(user));
        }
      },
    );
  }
}
