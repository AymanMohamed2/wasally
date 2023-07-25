part of 'category_details_cubit.dart';

abstract class CategoryDetailsState extends Equatable {
  const CategoryDetailsState();

  @override
  List<Object> get props => [];
}

class CategoryDetailsInitial extends CategoryDetailsState {}

class CategoryDetailsStateLoading extends CategoryDetailsState {}

class CategoryDetailsStatePaginationLoading extends CategoryDetailsState {}

class CategoryDetailsStatePaginationFailure extends CategoryDetailsState {}

class CategoryDetailsStateSuccess extends CategoryDetailsState {
  final List<Document> shopsList;

  const CategoryDetailsStateSuccess(this.shopsList);
}

class CategoryDetailsStateFailure extends CategoryDetailsState {
  final String errMessage;

  const CategoryDetailsStateFailure(this.errMessage);
}
