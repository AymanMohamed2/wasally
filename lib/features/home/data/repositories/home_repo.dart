import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failures.dart';
import '../models/category_details_model/document.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<Document>>> getCategoryDetails(
      {int pageNumber = 0});

  Future<Either<Failure, List<dynamic>>> getSliderList();
}
