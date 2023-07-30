part of 'old_orders_cubit.dart';

abstract class OldOrdersState extends Equatable {
  const OldOrdersState();

  @override
  List<Object> get props => [];
}

class OldOrdersInitial extends OldOrdersState {}

class OldOrdersSuccess extends OldOrdersState {
  final List<Document> orderList;

  const OldOrdersSuccess(this.orderList);
}

class OldOrdersLoading extends OldOrdersState {}

class OldOrdersFailure extends OldOrdersState {
  final String errMessage;

  const OldOrdersFailure(this.errMessage);
}
