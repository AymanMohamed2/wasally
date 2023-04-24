part of 'complete_order_get_location_cubit.dart';

abstract class CompleteOrderGetLocationState extends Equatable {
  const CompleteOrderGetLocationState();

  @override
  List<Object> get props => [];
}

class CompleteOrderGetLocationInitial extends CompleteOrderGetLocationState {}

class CompleteOrderGetLocationLoading extends CompleteOrderGetLocationState {}

class CompleteOrderGetLocationSuccess extends CompleteOrderGetLocationState {
  final String currentAddress;
  final Position currentPosition;

  const CompleteOrderGetLocationSuccess(
      {required this.currentAddress, required this.currentPosition});
}

class CompleteOrderGetLocationFailure extends CompleteOrderGetLocationState {
  final String errMessage;

  const CompleteOrderGetLocationFailure(this.errMessage);
}
