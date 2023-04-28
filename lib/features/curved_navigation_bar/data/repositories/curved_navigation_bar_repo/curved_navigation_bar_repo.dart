import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failures.dart';
import '../../../../auth/data/models/user_info_model/user_info_model.dart';
import '../../../../home/data/models/category_details_model/category_details_model.dart';

abstract class CurvedNavigationBarRepo {
  Future<Either<Failure, UserInfoModel>> getUserInfo({required String userId});
  Future<Either<Failure, CategoryDetailsModel>> postCategory({
    required String collectionId,
    required String name,
    required String address,
    required String categoryName,
    required String shopId,
  });
}
