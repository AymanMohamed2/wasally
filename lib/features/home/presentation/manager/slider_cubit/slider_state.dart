part of 'slider_cubit.dart';

abstract class SliderState extends Equatable {
  const SliderState();

  @override
  List<Object> get props => [];
}

class SliderInitial extends SliderState {}

class SliderStateLoading extends SliderState {}

class SliderStateSuccess extends SliderState {
  final List<dynamic> sliderList;

  const SliderStateSuccess(this.sliderList);
}

class SliderStateFailure extends SliderState {
  final String errMessage;

  const SliderStateFailure(this.errMessage);
}
