import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wasally/core/utils/api_services.dart';
import 'package:wasally/features/home/data/models/category_details_model/category_details_model.dart';

part 'category_details_state.dart';

class CategoryDetailsCubit extends Cubit<CategoryDetailsState> {
  CategoryDetailsCubit(this.apiServices) : super(CategoryDetailsInitial());

  ApiServices apiServices;

  Future<void> getCategoryDetails({required String collectionId}) async {
    var response =
        await apiServices.getCategoryDetails(collectionId: collectionId);
    response.fold(
      (failure) {
        emit(
          CategoryDetailsStateFailure(failure.errMessage),
        );
      },
      (categoryDetailsModel) {
        emit(
          CategoryDetailsStateSuccess(categoryDetailsModel),
        );
      },
    );
  }
}
