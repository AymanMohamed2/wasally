part of 'get_current_orders_cubit.dart';

abstract class GetCurrentOrdersState extends Equatable {
  const GetCurrentOrdersState();

  @override
  List<Object> get props => [];
}

class GetUserOrderInitial extends GetCurrentOrdersState {}

class GetUserOrderLoading extends GetCurrentOrdersState {}

class GetUserOrderSuccess extends GetCurrentOrdersState {
  final List<Document> orderList;

  const GetUserOrderSuccess(this.orderList);
}

class GetUserOrderFailure extends GetCurrentOrdersState {
  final String errMessage;

  const GetUserOrderFailure(this.errMessage);
}

class GetUserOrderPaginationLoading extends GetCurrentOrdersState {}

class GetUserOrderPaginationFailure extends GetCurrentOrdersState {}

class DeleteOrderSuccess extends GetCurrentOrdersState {}

class DeleteOrderFailure extends GetCurrentOrdersState {
  final String errMessage;

  const DeleteOrderFailure(this.errMessage);
}
