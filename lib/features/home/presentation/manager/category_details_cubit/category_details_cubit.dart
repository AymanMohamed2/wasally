import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wasally/features/home/data/models/category_details_model/category_details_model.dart';

import '../../../data/repositories/home_repo.dart';

part 'category_details_state.dart';

class CategoryDetailsCubit extends Cubit<CategoryDetailsState> {
  CategoryDetailsCubit(this.homeRepo) : super(CategoryDetailsInitial());

  final HomeRepo homeRepo;
  CategoryDetailsModel? categoryDetailsModel;

  Future<void> getCategoryDetails({required String collectionId}) async {
    var response =
        await homeRepo.getCategoryDetails(collectionId: collectionId);
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
        this.categoryDetailsModel = categoryDetailsModel;
      },
    );
  }
}
