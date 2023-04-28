import 'package:appwrite/appwrite.dart';
import 'package:dio/dio.dart';
import 'package:wasally/core/utils/api_services.dart';
import 'package:wasally/features/auth/data/models/login_model.dart';
import 'package:wasally/features/auth/data/models/signup_model.dart';
import 'package:wasally/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:wasally/features/auth/data/repositories/signup_repo/sign_up_repo.dart';
import 'package:wasally/features/home/data/models/category_details_model/category_details_model.dart';

class SignupRepoImpl implements SignupRepo {
  final ApiServices apiServices;

  SignupRepoImpl(this.apiServices);
  @override
  Future<Either<Failure, SignUpModel>> createAccount(
      {required String? name,
      required String? phoneNumber,
      required String? password,
      required String? email}) async {
    try {
      var response = await apiServices.post(
        endPoint: 'users',
        data: {
          "userId": ID.unique(),
          "phone": '+2$phoneNumber',
          "password": password,
          "name": name,
          "email": '$phoneNumber@gmail.com',
        },
        headers: {
          "Content-Type": "application/json",
          "X-Appwrite-Response-Format": "1.0.0",
          "X-Appwrite-Project": "6435d5e1a13eff6332c2",
          "X-Appwrite-Key":
              "0de0fe8c91c9c980d16bb39a2e1a579c29048e74ef33b879b4d2e11dbbeec648e6ceb198a7dc7b26898d2c990f33225d045ae64a70381449d33984abcb18714d8ad96f49e30cb4dd9e07b0402743bb52214bb3a0f8f18c780ce186f9ee9e7d84b33ea63a24844a2271e780046c3593fd02c8d1c6202c267c9d92439beb815940"
        },
      );

      return right(
        SignUpModel.fromJson(response),
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
  Future<Either<Failure, CategoryDetailsModel>> postCategory(
      {required String collectionId,
      required String name,
      required String address,
      required String categoryName}) async {
    try {
      var response = await apiServices.post(
          endPoint:
              'databases/643cc351878dafb57524/collections/$collectionId/documents',
          data: {
            'documentId': ID.unique(),
            'data': {
              'name': name,
              'address': address,
              'categoryName': categoryName,
            }
          },
          headers: {
            "Content-Type": "application/json",
            "X-Appwrite-Project": "6435d5e1a13eff6332c2",
            "X-Appwrite-Key":
                "0de0fe8c91c9c980d16bb39a2e1a579c29048e74ef33b879b4d2e11dbbeec648e6ceb198a7dc7b26898d2c990f33225d045ae64a70381449d33984abcb18714d8ad96f49e30cb4dd9e07b0402743bb52214bb3a0f8f18c780ce186f9ee9e7d84b33ea63a24844a2271e780046c3593fd02c8d1c6202c267c9d92439beb815940"
          });

      return right(
        CategoryDetailsModel.fromJson(response),
      );
    } on Exception catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  // @override
  // Future<Either<Failure, LoginModel>> createPhoneSession(
  //     {required String phoneNumber}) async {
  //   try {
  //     var response = await apiServices.put(
  //       endPoint: 'users',
  //       data: {
  //         "userId": ID.unique(),
  //         "phone": '+2$phoneNumber',
  //       },
  //       headers: {
  //         "Content-Type": "application/json",
  //         "X-Appwrite-Response-Format": "1.0.0",
  //         "X-Appwrite-Project": "6435d5e1a13eff6332c2",
  //       },
  //     );

  //     return right(
  //       LoginModel.fromJson(response),
  //     );
  //   } on Exception catch (e) {
  //     if (e is DioError) {
  //       return left(ServerFailure.fromDioError(e));
  //     } else {
  //       return left(ServerFailure(e.toString()));
  //     }
  //   }
  // }
}
