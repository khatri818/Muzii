import 'package:dartz/dartz.dart';

import '../../../../core/model/failure.dart';
import '../entities/check_user_response.dart';

abstract class AuthRepository {
  Future<Either<Failure, CheckUserResponse>> checkUserMobile(
      {required int mobile});
}
