part of 'fetch_products_cubit.dart';

abstract class FetchProductsState extends Equatable {
  const FetchProductsState();

  @override
  List<Object> get props => [];
}

class FetchProductsInitial extends FetchProductsState {}

class FetchProductsLoading extends FetchProductsState {}

class FetchProductsSuccess extends FetchProductsState {
  final List<Document> productsList;

  const FetchProductsSuccess(this.productsList);
}

class FetchProductsPaginationLoading extends FetchProductsState {}

class FetchProductsPaginationFailure extends FetchProductsState {
  final String errMessage;

  const FetchProductsPaginationFailure(this.errMessage);
}

class FetchProductsFailure extends FetchProductsState {
  final String errMessage;

  const FetchProductsFailure(this.errMessage);
}
