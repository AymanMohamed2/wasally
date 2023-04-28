import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../models/user_info_model/user_info_model.dart';
import '../models/login_model.dart';
import '../models/verify_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, LoginModel>> createPhoneSession({
    required String phoneNumber,
  });
  Future<Either<Failure, VerifyModel>> confirmPhoneSession({
    required String userId,
    required String secret,
  });
  Future<Either<Failure, UserInfoModel>> getUserInfo({required String userId});
}
