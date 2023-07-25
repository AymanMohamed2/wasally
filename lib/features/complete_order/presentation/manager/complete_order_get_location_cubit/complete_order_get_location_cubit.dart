import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:wasally/features/complete_order/presentation/view/widgets/custom_google_map.dart';

part 'complete_order_get_location_state.dart';

class CompleteOrderGetLocationCubit
    extends Cubit<CompleteOrderGetLocationState> {
  CompleteOrderGetLocationCubit() : super(CompleteOrderGetLocationInitial());
  Position? position;

  Future<void> getUserCurrentLocation() async {
    Position position;
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) async {
      await Geolocator.requestPermission();
    });
    emit(CompleteOrderGetLocationLoading());
    try {
      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      Get.to(() => CustomGoogleMap(
            position: position,
          ));
      this.position = position;
      emit(CompleteOrderGetLocationSuccess(position));
    } on Exception catch (_) {
      emit(const CompleteOrderGetLocationFailure(
          'There Was an Error pls try again'));
    }
  }
}
