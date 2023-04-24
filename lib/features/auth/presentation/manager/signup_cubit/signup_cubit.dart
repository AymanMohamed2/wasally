import 'package:bloc/bloc.dart';
import 'package:wasally/features/auth/data/models/signup_model.dart';
import 'package:wasally/features/auth/data/repositories/signup_repo/sign_up_repo.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.signupRepo) : super(SignupInitial());
  final SignupRepo signupRepo;
  String? phoneNumber;
  String? password;
  String? name;
  String? email;
  var accountType;
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

  void selectAccount({required var selected}) {
    if (selected == 'User Account' || selected == 'حساب مستخدم') {
      emit(SignUpUserState());
    } else if (selected == 'Shop Account' || selected == 'حساب متجر') {
      emit(BuisenessUserState());
    }
  }

  Future<void> signupUser({
    required String name,
    required String phoneNumber,
    required String password,
    required String email,
  }) async {
    emit(SignUpLoadingState());

    var response = await signupRepo.createAccount(
        name: name, phoneNumber: phoneNumber, password: password, email: email);

    response.fold(
      (failure) {
        emit(
          SignUpFailureState(failure.errMessage),
        );
      },
      (signup) async {
        if (accountType == 'Shop Account' || accountType == 'حساب متجر') {
          await signupRepo.postCategory(
            collectionId: getCollectionId()!,
            name: name,
            address: address,
            categoryName: category,
          );
        } else {
          null;
        }
        emit(
          SignUpSuccessState(signup),
        );
      },
    );
  }
}
