import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wasally/core/utils/api_services.dart';

part 'slider_state.dart';

class SliderCubit extends Cubit<SliderState> {
  SliderCubit(this.apiServices) : super(SliderInitial());
  ApiServices apiServices;
  List<dynamic>? items;
  String? email;

  Future<void> getSliderList() async {
    emit(SliderStateLoading());
    var response = await apiServices.getSliderList();
    response.fold((failure) {
      emit(SliderStateFailure(failure.errMessage));
    }, (sliderItems) {
      emit(SliderStateSuccess(sliderItems));
    });
  }
}
