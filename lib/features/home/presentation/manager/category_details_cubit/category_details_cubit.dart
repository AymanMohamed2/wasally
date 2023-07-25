import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/category_details_model/document.dart';
import '../../../data/repositories/home_repo.dart';

part 'category_details_state.dart';

class CategoryDetailsCubit extends Cubit<CategoryDetailsState> {
  CategoryDetailsCubit(this.homeRepo) : super(CategoryDetailsInitial());

  final HomeRepo homeRepo;
  List<Document> shopsList = [];

  Future<void> getCategoryDetails({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(CategoryDetailsStateLoading());
    } else {
      emit(CategoryDetailsStatePaginationLoading());
    }
    var response = await homeRepo.getCategoryDetails(pageNumber: pageNumber);
    response.fold(
      (failure) {
        emit(
          CategoryDetailsStateFailure(failure.errMessage),
        );
      },
      (shopsList) {
        this.shopsList.addAll(shopsList);

        emit(
          CategoryDetailsStateSuccess(shopsList),
        );
      },
    );
  }
}
