part of 'person_cubit.dart';

abstract class PersonState extends Equatable {
  const PersonState();

  @override
  List<Object> get props => [];
}

class PersonInitial extends PersonState {}

class PersonSuccess extends PersonState {
  final UserInfoModel userInfo;

  const PersonSuccess(this.userInfo);
}

class PersonLoading extends PersonState {}

class PersonFailure extends PersonState {
  final String errMessage;

  const PersonFailure(this.errMessage);
}
