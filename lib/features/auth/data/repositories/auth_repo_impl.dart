import 'package:appwrite/appwrite.dart';
import 'package:dio/dio.dart';
import 'package:wasally/core/networking/api_services.dart';
import 'package:wasally/features/auth/data/models/login_model.dart';

import 'package:wasally/core/errors/failures.dart';

import 'package:dartz/dartz.dart';
import 'package:wasally/features/auth/data/models/user_info_model/user_info_model.dart';

import '../models/verify_model.dart';
import 'auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiServices apiServices;

  AuthRepoImpl(this.apiServices);
  @override
  Future<Either<Failure, LoginModel>> createPhoneSession(
      {required String phoneNumber}) async {
    try {
      var response = await apiServices.post(
        endPoint: 'account/sessions/phone',
        data: {
          "userId": ID.unique(),
          "phone": '+2$phoneNumber',
        },
        headers: {
          "Content-Type": "application/json",
          "X-Appwrite-Response-Format": "1.0.0",
          "X-Appwrite-Project": "645ac8903beada8a7d13",
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

  @override
  Future<Either<Failure, VerifyModel>> confirmPhoneSession(
      {required String userId, required String secret}) async {
    try {
      var response = await apiServices.put(
        endPoint: 'account/sessions/phone',
        data: {
          "userId": userId,
          "secret": secret,
        },
        headers: {
          "Content-Type": "application/json",
          "X-Appwrite-Response-Format": "1.0.0",
          "X-Appwrite-Project": "645ac8903beada8a7d13",
        },
      );

      return right(
        VerifyModel.fromJson(response),
      );
    } on Exception catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, UserInfoModel>> getUserInfo(
      {required String userId}) async {
    try {
      var response = await apiServices.get(
        headers: {
          "Content-Type": "application/json",
          "X-Appwrite-Project": "645ac8903beada8a7d13",
          "X-Appwrite-Key":
              "8e6ec60f1c9eaea2c034d4ebaf6b918d6836d5167dbcb91aadc61f444a44ca94a147772bafc646f664add4703ab80aee612495c524dfbad4edc3388496bf359e0f78c3f8f27d67e2277bcfc1d8c93a88e0b28c34db25acf869691cd66aaa11e995fea9e4e82a4bb9cede9a88592999968630dd6848f032b93a9ca5697a9515ac"
        },
        endPoint: 'users/$userId',
      );

      return right(
        UserInfoModel.fromJson(response),
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
