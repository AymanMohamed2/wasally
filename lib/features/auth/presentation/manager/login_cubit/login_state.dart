part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginSuccessState extends LoginState {
  final LoginModel user;

  LoginSuccessState(this.user);
}

class LoginLoadingState extends LoginState {}

class LoginFailureState extends LoginState {
  final String errMessage;

  LoginFailureState(this.errMessage);
}
