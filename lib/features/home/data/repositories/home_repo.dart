import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failures.dart';
import '../models/category_details_model/category_details_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, CategoryDetailsModel>> getCategoryDetails(
      {required String collectionId});
  Future<Either<Failure, CategoryDetailsModel>> postOrderAdmin({
    required String name,
    required String phone,
    required String categoryName,
    required String shopName,
    required String order,
    required String address,
  });

  Future<Either<Failure, List<dynamic>>> getSliderList();
}
