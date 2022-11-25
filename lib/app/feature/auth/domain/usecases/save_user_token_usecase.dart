import '../repositories/login_repository.dart';

abstract class SaveUserTokenUseCase {
  Future<void> save({required String token});
}


class SaveUserTokenUseCaseImpl implements SaveUserTokenUseCase {
  final LoginRepository repository;

  SaveUserTokenUseCaseImpl(this.repository);
  
  @override
  Future<void> save({required String token})async {
    await repository.saveUserToken(token: token);
  }

}