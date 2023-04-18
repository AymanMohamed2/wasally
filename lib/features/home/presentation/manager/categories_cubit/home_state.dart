part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeStateLoading extends HomeState {}

class HomeStateSuccess extends HomeState {
  final CategoriesModel categories;

  HomeStateSuccess(this.categories);
}

class HomeStateFailure extends HomeState {
  final String errMessage;

  HomeStateFailure(this.errMessage);
}
