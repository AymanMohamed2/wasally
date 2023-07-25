part of 'complete_order_get_location_cubit.dart';

abstract class CompleteOrderGetLocationState extends Equatable {
  const CompleteOrderGetLocationState();

  @override
  List<Object> get props => [];
}

class CompleteOrderGetLocationInitial extends CompleteOrderGetLocationState {}

class CompleteOrderGetLocationSuccess extends CompleteOrderGetLocationState {
  final Position position;

  const CompleteOrderGetLocationSuccess(this.position);
}

class CompleteOrderGetLocationFailure extends CompleteOrderGetLocationState {
  final String errMessage;

  const CompleteOrderGetLocationFailure(this.errMessage);
}

class CompleteOrderGetLocationLoading extends CompleteOrderGetLocationState {}
