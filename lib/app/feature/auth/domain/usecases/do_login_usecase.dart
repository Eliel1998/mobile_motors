import 'package:either_dart/either.dart';
import 'package:mobile_motors/app/feature/auth/domain/entities/login_request_entity.dart';
import 'package:mobile_motors/app/feature/auth/domain/entities/user_info_entity.dart';

import '../../../../core/failures/failure.dart';
import '../repositories/login_repository.dart';

abstract class DoLoginUseCase {
  Future<Either<Failure, UserInfoEntity>> call({
    required LoginRequestEntity loginRequestEntity,
  });
}

class DoLoginUseCaseImpl implements DoLoginUseCase {
  final LoginRepository _repository;

  DoLoginUseCaseImpl({required LoginRepository repository}) : _repository = repository;

  @override
  Future<Either<Failure, UserInfoEntity>> call({required LoginRequestEntity loginRequestEntity}) async {
    return await _repository.doLogin(loginRequestEntity: loginRequestEntity);
  }
}
