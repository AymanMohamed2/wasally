part of 'delete_order_cubit.dart';

abstract class DeleteOrderState extends Equatable {
  const DeleteOrderState();

  @override
  List<Object> get props => [];
}

class DeleteOrderInitial extends DeleteOrderState {}

class DeleteOrderLoading extends DeleteOrderState {}

class DeleteOrderSuccess extends DeleteOrderState {}

class DeleteOrderFailure extends DeleteOrderState {
  final String errMessage;

 const DeleteOrderFailure(this.errMessage);
}
