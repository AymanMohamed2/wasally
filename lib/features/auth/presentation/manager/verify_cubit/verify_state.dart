part of 'verify_cubit.dart';

abstract class VerifyState extends Equatable {
  const VerifyState();

  @override
  List<Object> get props => [];
}

class VerifyInitial extends VerifyState {}

class VerifyLoading extends VerifyState {}

class VerifySuccess extends VerifyState {
  final VerifyModel loginModel;

  const VerifySuccess(this.loginModel);
}

class VerifyFailure extends VerifyState {
  final String errMessage;

  const VerifyFailure(this.errMessage);
}
