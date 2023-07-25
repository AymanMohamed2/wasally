part of 'pick_image_cubit.dart';

abstract class PickImageState extends Equatable {
  const PickImageState();

  @override
  List<Object> get props => [];
}

class PickImageInitial extends PickImageState {}

class PickImageLoading extends PickImageState {}

class PickImageSuccess extends PickImageState {}

class PickImageFailure extends PickImageState {
  final String errMessage;

  const PickImageFailure(this.errMessage);
}
