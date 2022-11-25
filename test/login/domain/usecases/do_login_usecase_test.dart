import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_motors/app/feature/auth/domain/entities/login_request_entity.dart';
import 'package:mobile_motors/app/feature/auth/domain/entities/user_info_entity.dart';
import 'package:mobile_motors/app/feature/auth/domain/repositories/login_repository.dart';
import 'package:mobile_motors/app/feature/auth/domain/usecases/do_login_usecase.dart';
import 'package:mocktail/mocktail.dart';

class LoginRepositoryMock extends Mock implements LoginRepository {}

void main() {
  late DoLoginUseCase usecase;
  late LoginRepository repository;

  setUp(() {
    repository = LoginRepositoryMock();
    usecase = DoLoginUseCaseImpl(repository: repository);
    registerFallbackValue(
      LoginRequestEntity(
        email: 'user',
        password: '123',
      ),
    );
  });

    test(
      'Verifica se o usecase retorna uma UserInfoEntity retornada pelo repository',
      () async {
    //Arrange
    final LoginRequestEntity request = LoginRequestEntity(
      email: 'user',
      password: '123',
    );

    final UserInfoEntity response = UserInfoEntity(
      id: 42,
      name: 'eliel',
      urlPhoto: 'dbkfdb',
      email: 'whatebr@com',
      login: 'user',
      token: 'token',
      roles: ['admin'],
    );

    when(
      () => repository.doLogin(
        loginRequestEntity: any(named: 'loginRequestEntity'),
      ),
    ).thenAnswer((_) async => Right(response));

    //Act
    final result = await usecase.call(loginRequestEntity: request);

    //Assert
    expect(result, Right(response));
    verify(() => repository.doLogin(loginRequestEntity: request)).called(1);
    verifyNoMoreInteractions(repository);
  });
}