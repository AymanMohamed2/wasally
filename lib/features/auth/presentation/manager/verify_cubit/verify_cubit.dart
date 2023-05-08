import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wasally/features/auth/data/repositories/auth_repo.dart';

import '../../../data/models/user_info_model/user_info_model.dart';
import '../../../data/models/verify_model.dart';

part 'verify_state.dart';

class VerifyCubit extends Cubit<VerifyState> {
  VerifyCubit(this.authRepo) : super(VerifyInitial());
  final AuthRepo authRepo;
  VerifyModel? verifyModel;
  UserInfoModel? userInfoModel;
  bool readOnly = false;
  
  Future<void> confirmPhoneSession({
    required String userId,
    required String secret,
  }) async {
    emit(VerifyLoading());
    readOnly = true;

    var response =
        await authRepo.confirmPhoneSession(secret: secret, userId: userId);

    response.fold(
      (failure) {
        emit(
          VerifyFailure(failure.errMessage),
        );
      },
      (login) async {
        verifyModel = login;
        await getUserInfo(userId: login.userId!);
        emit(
          VerifySuccess(login),
        );
      },
    );
  }

  Future<void> getUserInfo({
    required String userId,
  }) async {
    var response = await authRepo.getUserInfo(userId: userId);

    response.fold(
      (failure) => null,
      (userModel) {
        userInfoModel = userModel;
      },
    );
  }
}
