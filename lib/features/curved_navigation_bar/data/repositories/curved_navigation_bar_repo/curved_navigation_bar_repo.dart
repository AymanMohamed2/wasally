import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failures.dart';
import '../../models/person_model/person_model.dart';

abstract class CurvedNavigationBarRepo {
  Future<Either<Failure, UserInfoModel>> getUserInfo({required String userId});
}
