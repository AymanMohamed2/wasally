part of 'signup_cubit.dart';

abstract class SignupState {}

class SignupInitial extends SignupState {}

class SignUpUserState extends SignupState {}

class BuisenessUserState extends SignupState {}

class SignUpLoadingState extends SignupState {}

class SignUpSuccessState extends SignupState {
  final SignUpModel signUpModel;

  SignUpSuccessState(this.signUpModel);
}

class SignUpFailureState extends SignupState {
  final String errMessage;

  SignUpFailureState(this.errMessage);
}
