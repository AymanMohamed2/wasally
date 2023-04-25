import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

import '../../../data/repositories/home_repo.dart';

part 'complete_order_button_state.dart';

class CompleteOrderCubit extends Cubit<CompleteOrderState> {
  CompleteOrderCubit(this.homeRepo) : super(CompleteOrderInitial());
  final HomeRepo homeRepo;
  String? order;
  double? lat, long;

  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) async {
      await Geolocator.requestPermission();
    });
    return await Geolocator.getCurrentPosition();
  }

  Future<void> postOrderAdmin({
    required String name,
    required String phone,
    required String categoryName,
    required String shopName,
    required String order,
    required String address,
  }) async {
    emit(CompleteOrderLoading());
    var response = await homeRepo.postOrderAdmin(
      name: name,
      phone: phone,
      categoryName: categoryName,
      shopName: shopName,
      order: order,
      address: address,
    );

    response.fold((failure) {
      emit(CompleteOrderFailure(failure.errMessage));
    }, (r) {
      emit(CompleteOrderSuccess());
    });
  }
}
