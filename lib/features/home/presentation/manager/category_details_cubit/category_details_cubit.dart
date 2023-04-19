import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wasally/core/utils/api_services.dart';
import 'package:wasally/features/home/data/models/category_details_model/category_details_model.dart';

part 'category_details_state.dart';

class CategoryDetailsCubit extends Cubit<CategoryDetailsState> {
  CategoryDetailsCubit(this.apiServices) : super(CategoryDetailsInitial());

  ApiServices apiServices;

  Future<void> getDetailsPharmacy({required String collectionId}) async {
    var response = await apiServices.getCategoryDetailsPharmacy(
        collectionId: collectionId);
    response.fold(
      (Failure) {
        emit(
          CategoryDetailsStateFailure(Failure.errMessage),
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
