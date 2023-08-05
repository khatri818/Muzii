import 'package:dartz/dartz.dart';

import '../../../../core/model/failure.dart';
import '../../domain/entities/check_user_response.dart';

abstract class AuthDataSource {
  Future<Either<Failure, CheckUserResponse>> checkUserMobile(
      {required int mobile});
      
}
