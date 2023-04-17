import 'package:bloc/bloc.dart';
import 'package:wasally/core/utils/api_services.dart';
import 'package:wasally/features/auth/data/models/signup_model.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.apiService) : super(SignupInitial());
  ApiService apiService;

  void selectAccount({required var selected}) {
    if (selected == 'User Account') {
      emit(SignUpUserState());
    } else if (selected == 'Buiseness Account') {
      emit(BuisenessUserState());
    } else {
      emit(SignupInitial());
    }
  }

  Future<void> signupUser({
    required String name,
    required String phoneNumber,
    required String password,
    required String email,
  }) async {
    emit(SignUpLoadingState());

    var response = await apiService.creatAccount(
        name: name, phoneNumber: phoneNumber, password: password, email: email);

    response.fold(
      (failure) {
        emit(
          SignUpFailureState(failure.errMessage),
        );
      },
      (signup) {
        emit(
          SignUpSuccessState(signup),
        );
      },
    );
  }
}
