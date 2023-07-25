import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failures.dart';
import '../../../home/data/models/category_details_model/category_details_model.dart';
import '../models/product_model/document.dart';

abstract class CompleteOrderRepo {
  Future<Either<Failure, List<Document>>> fetchShopProducts(
      {required String shopId});
  Future<Either<Failure, CategoryDetailsModel>> postOrderAdmin({
    required String phone,
    required String categoryName,
    required String shopName,
    required String order,
    required String latitude,
    required String longitude,
    String? orderImage,
    String? playerId,
  });
  Future<Either<Failure, List<String>>> getPlayerIdsList();

  Future<Either<Failure, String>> createFile(
      {required String fileName, required String path});
}
