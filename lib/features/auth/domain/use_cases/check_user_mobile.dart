import 'package:dartz/dartz.dart';

import '../../../../core/model/failure.dart';
import '../entities/check_user_response.dart';
import '../repositories/auth_repository.dart';

class CheckUserMobile {
  final AuthRepository _authRepository;

  CheckUserMobile(this._authRepository);
  Future<Either<Failure, CheckUserResponse>> call({required int mobile}) {
    return _authRepository.checkUserMobile(mobile: mobile);
  }
}
