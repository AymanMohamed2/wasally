import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wasally/app.dart';
import 'features/splash/presentation/manager/splash_cubit/splash_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var email = prefs.getString("email");
  var password = prefs.getString("password");

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => SplashCubit()),
    ],
    child: Wasally(
      email: email,
      password: password,
    ),
  ));
}




// import 'package:equatable/equatable.dart';
// import 'package:wasally/features/home/presentation/view/category_details_view.dart';

// import '../../../../../core/utils/api_services.dart';
// import '../../../data/models/category_details_model/category_details_model.dart';
// import 'package:get/get.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// part 'category_details_state.dart';

// class CategoryDetailsCubit extends Cubit<CategoryDetailsState> {
//   CategoryDetailsCubit(this.apiServices) : super(CategoryDetailsInitial());

//   ApiServices apiServices;

//   Future<void> getCategoryDetailsPharmacy() async {
//     emit(CategoryDetailsLoading());
//     var response = await apiServices.getCategoryDetailsPharmacy();

//     response.fold((failure) {
//       emit(CategoryDetailsFailure(failure.errMessage));
//     }, (categoryDetailsModel) {
//       emit(CategoryDetailsSuccess(categoryDetailsModel));
//     });
//   }

//   Future<void> getCategoryDetailsRestaurant() async {
//     Get.to(() => const CategoryDetailsView(title: 'Restaurant'));
//     emit(CategoryDetailsLoading());
//     var response = await apiServices.getCategoryDetailsRestaurant();

//     response.fold((failure) {
//       emit(CategoryDetailsFailure(failure.errMessage));
//     }, (categoryDetailsModel) {
//       emit(CategoryDetailsSuccess(categoryDetailsModel));
//     });
//   }
// }







// part of 'category_details_cubit.dart';

// abstract class CategoryDetailsState extends Equatable {
//   const CategoryDetailsState();

//   @override
//   List<Object> get props => [];
// }

// class CategoryDetailsInitial extends CategoryDetailsState {}

// class CategoryDetailsLoading extends CategoryDetailsState {}

// class CategoryDetailsSuccess extends CategoryDetailsState {
//   final CategoryDetailsModel categoryDetailsModel;

//   const CategoryDetailsSuccess(this.categoryDetailsModel);
// }

// class CategoryDetailsFailure extends CategoryDetailsState {
//   final String errMessage;

//   const CategoryDetailsFailure(this.errMessage);
// }

