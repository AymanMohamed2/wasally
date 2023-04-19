import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasally/features/auth/data/models/login_model.dart';

import '../../../../../core/utils/api_services.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.apiService) : super(LoginInitial());
  ApiServices apiService;

  LoginModel? loginModel;

  Future<void> loginUser({
    required String? email,
    required String? password,
  }) async {
    emit(LoginLoadingState());

    var response = await apiService.loginUser(email: email, password: password);

    response.fold((failure) {
      emit(
        LoginFailureState(failure.errMessage),
      );
    }, (login) {
      loginModel = login;
      emit(
        LoginSuccessState(login),
      );
    });
  }
}
