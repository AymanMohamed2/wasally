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
          "X-Appwrite-Project": "6435d5e1a13eff6332c2",
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
          "X-Appwrite-Project": "6435d5e1a13eff6332c2",
          "X-Appwrite-Key":
              "0de0fe8c91c9c980d16bb39a2e1a579c29048e74ef33b879b4d2e11dbbeec648e6ceb198a7dc7b26898d2c990f33225d045ae64a70381449d33984abcb18714d8ad96f49e30cb4dd9e07b0402743bb52214bb3a0f8f18c780ce186f9ee9e7d84b33ea63a24844a2271e780046c3593fd02c8d1c6202c267c9d92439beb815940"
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
