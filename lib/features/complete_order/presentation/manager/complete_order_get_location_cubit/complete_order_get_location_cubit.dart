import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:wasally/features/complete_order/presentation/view/widgets/custom_google_map.dart';

part 'complete_order_get_location_state.dart';

class CompleteOrderGetLocationCubit
    extends Cubit<CompleteOrderGetLocationState> {
  CompleteOrderGetLocationCubit() : super(CompleteOrderGetLocationInitial());
  LocationData? currentLocation;
  // Position? position;

  // Future<void> getUserCurrentLocation() async {
  //   Position position;
  //   await Geolocator.requestPermission()
  //       .then((value) {})
  //       .onError((error, stackTrace) async {
  //     await Geolocator.requestPermission();
  //   });
  //   emit(CompleteOrderGetLocationLoading());
  //   try {
  //     position = await Geolocator.getCurrentPosition(
  //         desiredAccuracy: LocationAccuracy.high);

  // Get.to(() => CustomGoogleMap(
  //       position: position,
  //     ));
  //     this.position = position;
  //     emit(CompleteOrderGetLocationSuccess(position));
  //   } on Exception catch (_) {
  //     emit(const CompleteOrderGetLocationFailure(
  //         'There Was an Error pls try again'));
  //   }
  // }
  Future<void> getUserCurrentLocation() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    try {
      emit(CompleteOrderGetLocationLoading());
      currentLocation = await location.getLocation();
      Get.to(() => CustomGoogleMap(
            locationData: currentLocation!,
          ));
      emit(CompleteOrderGetLocationSuccess(currentLocation!));
    } on Exception catch (_) {
      emit(const CompleteOrderGetLocationFailure(
          'There Was an Error pls try again'));
    }
  }
}
