import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failures.dart';
import '../models/product_model/document.dart';

abstract class CompleteOrderRepo {
  Future<Either<Failure, List<Document>>> fetchShopProducts(
      {required String shopId, int pageNumber = 0});
  Future<Either<Failure, void>> postOrderAdmin({
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
