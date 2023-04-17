import 'package:appwrite/appwrite.dart';
import 'package:dartz/dartz.dart';
import 'package:wasally/core/errors/failures.dart';
import 'package:dio/dio.dart';

import '../../features/auth/data/models/login_model.dart';
import '../../features/auth/data/models/signup_model.dart';

class ApiService {
  Future<Either<Failure, SignUpModel>> creatAccount({
    required String? name,
    required String? phoneNumber,
    required String? password,
    required String? email,
  }) async {
    String baseUrl = "https://cloud.appwrite.io/v1/users";

    var headers = {
      "Content-Type": "application/json",
      "X-Appwrite-Response-Format": "1.0.0",
      "X-Appwrite-Project": "6435d5e1a13eff6332c2",
      "X-Appwrite-Key":
          "0de0fe8c91c9c980d16bb39a2e1a579c29048e74ef33b879b4d2e11dbbeec648e6ceb198a7dc7b26898d2c990f33225d045ae64a70381449d33984abcb18714d8ad96f49e30cb4dd9e07b0402743bb52214bb3a0f8f18c780ce186f9ee9e7d84b33ea63a24844a2271e780046c3593fd02c8d1c6202c267c9d92439beb815940"
    };

    Map<String, dynamic> body = {
      "userId": ID.unique(),
      "phone": '+2$phoneNumber',
      "password": password,
      "name": name,
      "email": email,
    };

    // http.Response response = await http.post(Uri.parse(baseUrl),
    //     headers: headers, body: jsonEncode(body));
    // if (response.statusCode == 201) {
    //   print("data inserted success");
    //   print(response.body);
    // } else {
    //   print("faild");
    //   print(response.body);
    // }

    try {
      var response = await Dio()
          .post(baseUrl, options: Options(headers: headers), data: body);

      print(response);
      return right(
        SignUpModel.fromJson(response.data),
      );
    } on Exception catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(
          ServerFailure(
            e.toString(),
          ),
        );
      }
    }
  }

  Future<Either<Failure, LoginModel>> loginUser(
      {required String? email, required String? password}) async {
    String baseUrl = "https://cloud.appwrite.io/v1/account/sessions/email";

    var headers = {
      "Content-Type": "application/json",
      "X-Appwrite-Response-Format": "1.0.0",
      "X-Appwrite-Project": "6435d5e1a13eff6332c2",
    };

    Map<String, dynamic> data = {
      "email": email,
      "password": password,
    };
    // http.Response response = await http.post(Uri.parse(baseUrl),
    //     headers: headers, body: jsonEncode(body));

    // var response = await Dio().get(baseUrl);
    try {
      var response = await Dio().post(
        baseUrl,
        options: Options(
          headers: headers,
        ),
        data: data,
      );

      return right(LoginModel.fromJson(response.data));
    } catch (e) {
      print(e);
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(
          ServerFailure(
            e.toString(),
          ),
        );
      }
    }
  }
}
