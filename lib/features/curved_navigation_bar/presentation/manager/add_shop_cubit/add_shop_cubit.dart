import 'package:bloc/bloc.dart';
import 'package:wasally/features/home/data/models/category_details_model/category_details_model.dart';

import '../../../data/repositories/curved_navigation_bar_repo/curved_navigation_bar_repo.dart';

part 'add_shop_state.dart';

class AddShopCubit extends Cubit<AddShopState> {
  AddShopCubit(this.curvedNavigationBarRepo) : super(AddShopInitial());
  final CurvedNavigationBarRepo curvedNavigationBarRepo;
  String? phoneNumber;
  String? password;
  String? name;
  String? email;
  var category;
  var address;

  String? getCollectionId() {
    if (category == 'Restaurant' || category == 'مطعم') {
      return '643fff738de6a968c5ba';
    } else if (category == 'Super Market' || category == 'سوبر ماركت') {
      return '64405ac2df4dd40f4524';
    } else if (category == 'Pharmacy' || category == 'صيدليه') {
      return '643cc36ba7aa0f87942e';
    } else if (category == 'Bakery and sweets' ||
        category == 'مخبوزات و حلويات') {
      return '64405c5d508f5a87af04';
    } else if (category == 'Vegetables and Fruits' ||
        category == 'خضار و قاكهه') {
      return '64405cdd6349581b8a59';
    } else if (category == 'Library' || category == 'مكتبه') {
      return '64405d822764430f3f55';
    } else {
      return null;
    }
  }

  Future<void> postCategory({
    required String name,
    required String shopId,
  }) async {
    emit(AddShopLoading());

    var response = await curvedNavigationBarRepo.postCategory(
      collectionId: getCollectionId()!,
      name: name,
      shopId: shopId,
      address: address,
      categoryName: category,
    );

    response.fold(
      (failure) {
        emit(
          AddShopFailure(failure.errMessage),
        );
      },
      (categoryDetailsModel) async {
        emit(
          AddShopSuccess(categoryDetailsModel),
        );
      },
    );
  }
}
