import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

part 'complete_order_get_location_state.dart';

class CompleteOrderGetLocationCubit
    extends Cubit<CompleteOrderGetLocationState> {
  CompleteOrderGetLocationCubit() : super(CompleteOrderGetLocationInitial());
  Position? position;

  Future<Position> getUserCurrentLocation() async {
    Position position;
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) async {
      await Geolocator.requestPermission();
    });

    position = await Geolocator.getCurrentPosition();
    this.position = position;
    emit(CompleteOrderGetLocationSuccess(position));
    return position;
  }
}
