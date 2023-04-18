import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wasally/core/utils/api_services.dart';
import 'package:wasally/features/home/data/models/categories_model/categories_model.dart';

part 'home_state.dart';

class CategoriesCubit extends Cubit<HomeState> {
  CategoriesCubit(this.apiServices) : super(HomeInitial());
  ApiServices apiServices;

  Future<void> getCategories() async {
    emit(HomeStateLoading());
    var response = await apiServices.getCategories();

    response.fold((failure) {
      emit(
        HomeStateFailure(failure.errMessage),
      );
    }, (categories) {
      emit(
        HomeStateSuccess(categories),
      );
    });
  }
}
