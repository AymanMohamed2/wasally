import 'package:dartz/dartz.dart';
import 'package:wasally/features/complete_order/data/models/new_version_model/new_version_model.dart';

import '../../../../../core/errors/failures.dart';
import '../models/category_details_model/document.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<Document>>> getCategoryDetails(
      {int pageNumber = 0});
  Future<Either<Failure, NewVersionModel>> getNewVersion();

  Future<Either<Failure, List<dynamic>>> getSliderList();
}
