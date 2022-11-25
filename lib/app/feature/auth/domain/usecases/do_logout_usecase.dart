import '../repositories/login_repository.dart';

abstract class DoLogoutUseCase{
  Future<void> call();
}

class DoLogoutUsecaseImpl implements DoLogoutUseCase{
  final LoginRepository _repository;

  DoLogoutUsecaseImpl({required LoginRepository repository}) : _repository = repository;

  @override
  Future<void> call() async {
    return await _repository.logout();
  }
}