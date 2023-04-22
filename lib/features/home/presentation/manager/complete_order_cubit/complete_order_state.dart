part of 'complete_order_cubit.dart';

abstract class CompleteOrderState extends Equatable {
  const CompleteOrderState();

  @override
  List<Object> get props => [];
}

class CompleteOrderInitial extends CompleteOrderState {}

class CompleteOrderSuccess extends CompleteOrderState {}

class CompleteOrderLoading extends CompleteOrderState {}

class CompleteOrderFailure extends CompleteOrderState {
  final String errMessage;

  const CompleteOrderFailure(this.errMessage);
}
