import 'package:either_dart/either.dart';
import 'package:mobile_motors/app/feature/auth/domain/entities/user_info_entity.dart';

import 'package:mobile_motors/app/feature/auth/domain/entities/login_request_entity.dart';

import '../../../../core/failures/failure.dart';
import '../../domain/repositories/login_repository.dart';
import '../datasource/login_datasource.dart';

class LoginRepositoryImpl implements LoginRepository{
  final LoginDatasource _datasource;
  LoginRepositoryImpl({required LoginDatasource datasource}) : _datasource = datasource;
  
  @override
  Future<Either<Failure, UserInfoEntity>>doLogin({required LoginRequestEntity loginRequestEntity}) async {
      return await _datasource.doLogin(loginRequestEntity: loginRequestEntity);
  }
  
  @override
  Future<void> saveUserToken({required String token}) {
    return _datasource.saveUserToken(token: token);
  }
  
  @override
  Future<void> logout() {
    return _datasource.logout();
  }

}