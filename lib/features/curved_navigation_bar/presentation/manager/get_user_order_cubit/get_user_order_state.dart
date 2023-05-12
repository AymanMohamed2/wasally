part of 'get_user_order_cubit.dart';

abstract class GetUserOrderState extends Equatable {
  const GetUserOrderState();

  @override
  List<Object> get props => [];
}

class GetUserOrderInitial extends GetUserOrderState {}

class GetUserOrderLoading extends GetUserOrderState {}

class GetUserOrderSuccess extends GetUserOrderState {
  final List<Document> orderList;

  const GetUserOrderSuccess(this.orderList);
}

class GetUserOrderFailure extends GetUserOrderState {
  final String errMessage;

  const GetUserOrderFailure(this.errMessage);
}
