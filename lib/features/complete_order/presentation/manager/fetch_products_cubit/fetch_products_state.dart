part of 'fetch_products_cubit.dart';

abstract class FetchProductsState extends Equatable {
  const FetchProductsState();

  @override
  List<Object> get props => [];
}

class FetchProductsInitial extends FetchProductsState {}

class FetchProductsLoading extends FetchProductsState {}

class FetchProductsSuccess extends FetchProductsState {}

class FetchProductsFailure extends FetchProductsState {
  final String errMessage;

  const FetchProductsFailure(this.errMessage);
}
