import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wasally/core/utils/api_services.dart';

import '../../../data/models/person_model/person_model.dart';

part 'person_state.dart';

class PersonCubit extends Cubit<PersonState> {
  PersonCubit(this.apiServices) : super(PersonInitial());
  ApiServices apiServices;
  UserInfoModel? userInfo;

  Future<void> getUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userId = prefs.getString('userId')!;
    emit(PersonLoading());

    var response = await apiServices.getUserInfo(userId: userId);
    response.fold((failure) {
      emit(PersonFailure(failure.errMessage));
    }, (userInfo) {
      emit(PersonSuccess(userInfo));
      this.userInfo = userInfo;
    });
  }
}
