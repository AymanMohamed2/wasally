import 'package:dio/dio.dart';
import 'package:wasally/core/utils/api_services.dart';
import 'package:wasally/features/auth/data/models/login_model.dart';

import 'package:wasally/core/errors/failures.dart';

import 'package:dartz/dartz.dart';

import 'login_repo.dart';

class LoginRepoImpl implements LoginRepo {
  final ApiServices apiServices;

  LoginRepoImpl(this.apiServices);
  @override
  Future<Either<Failure, LoginModel>> loginUser(
      {required String? email, required String? password}) async {
    try {
      var response = await apiServices.post(
        endPoint: 'account/sessions/email',
        data: {
          "email": '$email@gmail.com',
          "password": password,
        },
        headers: {
          "Content-Type": "application/json",
          "X-Appwrite-Response-Format": "1.0.0",
          "X-Appwrite-Project": "6435d5e1a13eff6332c2",
        },
      );

      return right(
        LoginModel.fromJson(response),
      );
    } on Exception catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
