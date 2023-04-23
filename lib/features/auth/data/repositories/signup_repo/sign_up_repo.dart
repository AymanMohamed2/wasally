import 'package:dartz/dartz.dart';
import 'package:wasally/features/auth/data/models/signup_model.dart';

import '../../../../../core/errors/failures.dart';
import '../../../../home/data/models/category_details_model/category_details_model.dart';

abstract class SignupRepo {
  Future<Either<Failure, SignUpModel>> createAccount({
    required String? name,
    required String? phoneNumber,
    required String? password,
    required String? email,
  });
  Future<Either<Failure, CategoryDetailsModel>> postCategory({
    required String collectionId,
    required String name,
    required String address,
    required String categoryName,
  });
}
