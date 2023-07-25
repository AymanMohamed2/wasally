import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../complete_order/data/repositories/complete_order_repo.dart';
import '../../../../complete_order/data/models/product_model/document.dart';

part 'fetch_products_state.dart';

class FetchProductsCubit extends Cubit<FetchProductsState> {
  FetchProductsCubit(this.completeOrderRepo) : super(FetchProductsInitial());
  final CompleteOrderRepo completeOrderRepo;
  List<Document>? productsList;

  Future<void> fetchShopProducts({required String shopId}) async {
    emit(FetchProductsLoading());
    var response = await completeOrderRepo.fetchShopProducts(shopId: shopId);

    response.fold(
      (failure) {
        emit(
          FetchProductsFailure(failure.errMessage),
        );
      },
      (products) {
        productsList = products;
        emit(FetchProductsSuccess());
      },
    );
  }
}
