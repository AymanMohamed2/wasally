import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasally/features/auth/data/models/login_model.dart';

import '../../../data/models/user_info_model/user_info_model.dart';
import '../../../data/repositories/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepo) : super(LoginInitial());
  final AuthRepo loginRepo;

  LoginModel? loginModel;
  String? phone;
  UserInfoModel? userInfo;

  Future<void> createPhoneSession({
    required String phoneNumber,
  }) async {
    emit(LoginLoadingState());

    var response = await loginRepo.createPhoneSession(phoneNumber: phoneNumber);

    response.fold(
      (failure) {
        emit(
          LoginFailureState(failure.errMessage),
        );
      },
      (login) {
        loginModel = login;
        emit(
          LoginSuccessState(login),
        );
      },
    );
  }
}
