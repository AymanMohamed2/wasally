import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/repositories/home_repo.dart';

part 'complete_order_state.dart';

class CompleteOrderCubit extends Cubit<CompleteOrderState> {
  CompleteOrderCubit(this.homeRepo) : super(CompleteOrderInitial());
  final HomeRepo homeRepo;
  String? order;

  Future<void> postOrderAdmin(
      {required String name,
      required String phone,
      required String categoryName,
      required String shopName,
      required String order}) async {
    emit(CompleteOrderLoading());
    var response = await homeRepo.postOrderAdmin(
        name: name,
        phone: phone,
        categoryName: categoryName,
        shopName: shopName,
        order: order);

    response.fold((failure) {
      emit(CompleteOrderFailure(failure.errMessage));
    }, (r) {
      emit(CompleteOrderSuccess());
    });
  }
}
