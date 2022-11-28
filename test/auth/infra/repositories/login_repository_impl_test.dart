import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_motors/app/feature/auth/domain/entities/login_request_entity.dart';
import 'package:mobile_motors/app/feature/auth/domain/entities/user_info_entity.dart';
import 'package:mobile_motors/app/feature/auth/domain/failures/login_failure.dart';
import 'package:mobile_motors/app/feature/auth/domain/repositories/login_repository.dart';
import 'package:mobile_motors/app/feature/auth/infra/datasource/login_datasource.dart';
import 'package:mobile_motors/app/feature/auth/infra/repositories/login_repository_impl.dart';
import 'package:mocktail/mocktail.dart';

class LoginDatasourceMock extends Mock implements LoginDatasource {}

void main() {
  late LoginDatasource datasource;
  late LoginRepository repository;

  setUp(() {
    datasource = LoginDatasourceMock();
    repository = LoginRepositoryImpl(datasource: datasource);
    registerFallbackValue(
      LoginRequestEntity(
        email: 'user',
        password: '123',
      ),
    );
  });

  test(
      'Deve retornar um UserInfoEntity, quando o dataSource for executado com sucesso.',
      () async {
    // arrange
    final LoginRequestEntity request = LoginRequestEntity(
      email: 'eliel@gmail.com',
      password: 'passoncn',
    );

    final UserInfoEntity response = UserInfoEntity(
      id: 30,
      name: 'Eliel',
      urlPhoto: 'teste',
      email: 'eliel@com',
      login: 'eliel',
      roles: ['ROLE_USER'],
      token: 'token',
    );

    when(
      () => datasource.doLogin(
        loginRequestEntity: any(named: 'loginRequestEntity'),
      ),
    ).thenAnswer((_) async => Right(response));

    // act
    final result = await repository.doLogin(loginRequestEntity: request);
    // assert
    expect(result, Right(response));
    verify(() => datasource.doLogin(loginRequestEntity: request)).called(1);
    verifyNoMoreInteractions(datasource);
  });

  test('Deve lançar um rethrow, quando o dataSource lançar uma LoginFailure.',
      () {
    // arrange
    final LoginRequestEntity request = LoginRequestEntity(
      email: 'eliel@gmail.com',
      password: 'passoncn',
    );
    when(
      () => datasource.doLogin(
        loginRequestEntity: any(named: 'loginRequestEntity'),
      ),
    ).thenThrow(NoInternetLoginFailure());

    // assert
    expect(
      () => repository.doLogin(loginRequestEntity: request),
      throwsA(
        NoInternetLoginFailure(),
      ),
    );

    verify(() => datasource.doLogin(loginRequestEntity: request)).called(1);
    verifyNoMoreInteractions(datasource);
  });

  test(
      'Deve lançar uma UnknownLoginFailure, quando o dataSource lançar qualquer exceçao.',
      () {
    // arrange
    final LoginRequestEntity request = LoginRequestEntity(
      email: 'eliel@gmail.com',
      password: 'passoncn',
    );
    when(
      () => datasource.doLogin(
        loginRequestEntity: any(named: 'loginRequestEntity'),
      ),
    ).thenAnswer((_) async => throw Exception());

    // assert
    expect(
      () => repository.doLogin(loginRequestEntity: request),
      throwsA(
       isA(),
      ),
    );

    verify(() => datasource.doLogin(loginRequestEntity: request)).called(1);
    verifyNoMoreInteractions(datasource);
  });
}
