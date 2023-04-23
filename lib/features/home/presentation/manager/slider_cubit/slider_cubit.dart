import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/repositories/home_repo.dart';

part 'slider_state.dart';

class SliderCubit extends Cubit<SliderState> {
  SliderCubit(this.homeRepo) : super(SliderInitial());
  final HomeRepo homeRepo;
  List<dynamic>? items;

  Future<void> getSliderList() async {
    emit(SliderStateLoading());
    var response = await homeRepo.getSliderList();
    response.fold((failure) {
      emit(SliderStateFailure(failure.errMessage));
    }, (sliderItems) {
      emit(SliderStateSuccess(sliderItems));
    });
  }
}
