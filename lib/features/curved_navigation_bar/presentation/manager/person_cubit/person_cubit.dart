import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/models/person_model/person_model.dart';
import '../../../data/repositories/curved_navigation_bar_repo/curved_navigation_bar_repo.dart';

part 'person_state.dart';

class PersonCubit extends Cubit<PersonState> {
  PersonCubit(this.curvedNavigationBarRepo) : super(PersonInitial());
  final CurvedNavigationBarRepo curvedNavigationBarRepo;
  UserInfoModel? userInfo;

  Future<void> getUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userId = prefs.getString('userId')!;
    emit(PersonLoading());

    var response = await curvedNavigationBarRepo.getUserInfo(userId: userId);
    response.fold((failure) {
      emit(PersonFailure(failure.errMessage));
    }, (userInfo) {
      emit(PersonSuccess(userInfo));
      this.userInfo = userInfo;
    });
  }
}
