import 'package:either_dart/either.dart';
import 'package:mobile_motors/app/core/failures/failure.dart';
import 'package:mobile_motors/app/feature/auth/domain/entities/login_request_entity.dart';
import 'package:mobile_motors/app/feature/auth/domain/entities/user_info_entity.dart';

abstract class LoginDatasource {
  Future<Either<Failure, UserInfoEntity>> doLogin({required LoginRequestEntity loginRequestEntity});
  Future<void> saveUserToken({required String token});
  Future<void> logout();
}
