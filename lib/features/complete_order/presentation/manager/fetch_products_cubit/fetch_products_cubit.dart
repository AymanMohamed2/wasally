import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../complete_order/data/repositories/complete_order_repo.dart';
import '../../../../complete_order/data/models/product_model/document.dart';

part 'fetch_products_state.dart';

class FetchProductsCubit extends Cubit<FetchProductsState> {
  FetchProductsCubit(this.completeOrderRepo) : super(FetchProductsInitial());
  final CompleteOrderRepo completeOrderRepo;
  List<Document> productsList = [];

  Future<void> fetchShopProducts(
      {required String shopId, int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(FetchProductsLoading());
    } else {
      emit(FetchProductsPaginationLoading());
    }
    var response = await completeOrderRepo.fetchShopProducts(
        shopId: shopId, pageNumber: pageNumber);

    response.fold(
      (failure) {
        if (pageNumber == 0) {
          emit(
            FetchProductsFailure(failure.errMessage),
          );
        } else {
          emit(FetchProductsPaginationFailure(failure.errMessage));
        }
      },
      (products) {
        emit(FetchProductsSuccess(products));
      },
    );
  }
}
