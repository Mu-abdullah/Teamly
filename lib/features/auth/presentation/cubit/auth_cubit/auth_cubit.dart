import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../core/language/lang_keys.dart';
import '../../../data/repo/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo authRepo;
  bool remmeberMe = false;
  AuthCubit(this.authRepo) : super(AuthInitial()) {
    init();
  }
  static AuthCubit get(context) => BlocProvider.of(context);

  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  void init() {
    emit(AuthInitial());
  }

  void login() async {
    emit(AuthLoading());
    var result = await authRepo.signIn(
      email: emailController.text,
      password: passwordController.text,
    );
    result.fold(
      (error) {
        if (!isClosed) {
          emit(AuthError(error.message));
        }
      },
      (response) {
        if (!isClosed) {
          if (response.user != null) {
            emit(AuthSuccess(response));
          } else {
            emit(UserNotFound(LangKeys.userNotFound));
          }
        }
      },
    );
  }

  void saveMe() {
    if (remmeberMe == true) {
      authRepo.remmeberMe();
    }
  }
}
