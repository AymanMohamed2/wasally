import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failures.dart';
import '../../../../auth/data/models/user_info_model/user_info_model.dart';

abstract class CurvedNavigationBarRepo {
  Future<Either<Failure, UserInfoModel>> getUserInfo({required String userId});
}
