import 'package:either_dart/either.dart';

import '../../../../core/failures/failure.dart';
import '../entities/login_request_entity.dart';
import '../entities/user_info_entity.dart';

abstract class LoginRepository {
  Future<Either<Failure, UserInfoEntity>> doLogin({required LoginRequestEntity loginRequestEntity});
  Future<void> saveUserToken({required String token});
  Future<void> logout();
}
