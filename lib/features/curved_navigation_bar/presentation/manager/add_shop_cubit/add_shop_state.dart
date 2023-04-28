part of 'add_shop_cubit.dart';

abstract class AddShopState {}

class AddShopInitial extends AddShopState {}

class AddShopLoading extends AddShopState {}

class AddShopSuccess extends AddShopState {
  final CategoryDetailsModel categoryDetailsModel;

  AddShopSuccess(this.categoryDetailsModel);
}

class AddShopFailure extends AddShopState {
  final String errMessage;

  AddShopFailure(this.errMessage);
}
