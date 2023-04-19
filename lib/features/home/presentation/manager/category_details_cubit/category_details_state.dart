part of 'category_details_cubit.dart';

abstract class CategoryDetailsState extends Equatable {
  const CategoryDetailsState();

  @override
  List<Object> get props => [];
}

class CategoryDetailsInitial extends CategoryDetailsState {}

class CategoryDetailsStateLoading extends CategoryDetailsState {}

class CategoryDetailsStateSuccess extends CategoryDetailsState {
  final CategoryDetailsModel categoryDetailsModel;

  const CategoryDetailsStateSuccess(this.categoryDetailsModel);
}

class CategoryDetailsStateFailure extends CategoryDetailsState {
  final String errMessage;

  const CategoryDetailsStateFailure(this.errMessage);
}
