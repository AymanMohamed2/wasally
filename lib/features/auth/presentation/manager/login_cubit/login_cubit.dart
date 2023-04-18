import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wasally/features/auth/data/models/login_model.dart';

import '../../../../../core/utils/api_services.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.apiService) : super(LoginInitial());
  ApiServices apiService;

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
      emit(
        LoginSuccessState(login),
      );
    });
  }
}
