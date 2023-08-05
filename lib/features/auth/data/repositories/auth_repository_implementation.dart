import 'package:dartz/dartz.dart';

import '../../../../core/model/failure.dart';
import '../../domain/entities/check_user_response.dart';
import '../../domain/repositories/auth_repository.dart';
import '../data_source/auth_data_source.dart';

class AuthRepositoryImplementation extends AuthRepository {
  final AuthDataSource _authDataSource;

  AuthRepositoryImplementation(this._authDataSource);

  @override
  Future<Either<Failure, CheckUserResponse>> checkUserMobile(
      {required int mobile}) {
    return _authDataSource.checkUserMobile(mobile: mobile);
  }
}
