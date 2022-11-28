import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_motors/app/core/localstorage/local_storage.dart';
import 'package:mobile_motors/app/feature/auth/domain/entities/login_request_entity.dart';
import 'package:mobile_motors/app/feature/auth/domain/failures/login_failure.dart';
import 'package:mobile_motors/app/feature/auth/domain/usecases/set_dio_headers_interceptor_usecase.dart';
import 'package:mobile_motors/app/feature/auth/external/datasource/login_datasource_impl.dart';
import 'package:mobile_motors/app/feature/auth/infra/datasource/login_datasource.dart';
import 'package:mocktail/mocktail.dart';

class DioMock extends Mock implements Dio {}
class LocalStorageMock extends Mock implements LocalStorage {}
class SetDioHeadersInterceptorUsecaseMock extends Mock implements SetDioHeadersInterceptorUsecaseImpl {}

void main() {
  late Dio dio;
  late LocalStorage localStorage;
  late SetDioHeadersInterceptorUsecaseImpl setDioHeadersInterceptorUsecase;
  late LoginDatasource loginDatasource;

  setUp(() {
    dio = DioMock();
    localStorage = LocalStorageMock();
    setDioHeadersInterceptorUsecase = SetDioHeadersInterceptorUsecaseMock();
    loginDatasource = LoginDatasourceImpl(dio: dio,storage: localStorage,setDioHeadersInterceptorUsecase: setDioHeadersInterceptorUsecase);

    registerFallbackValue(
      LoginRequestEntity(
        email: 'user',
        password: '123',
      ),
    );
  });

  group('doLogin', () {
    //arrange
    final mapRequest = {'username': 'teste', 'password': 'teste'};
    final LoginRequestEntity loginRequestEntity =
        LoginRequestEntity(email: 'teste', password: 'teste');



    test(
        'Lancar um excessão do tipo DataSourceLoginFailure caso status code do Response seja diferente de 200 ',
        () {
      //Arrange

      final mapResponse = {'error': 'Login incorreto'};

      when(
        () => dio.post(any(), data: mapRequest),
      ).thenAnswer(
        (_) async => Response(
          statusCode: 205,
          data: mapResponse,
          requestOptions: RequestOptions(
            path: 'https://carros-springboot.herokuapp.com/api/v2/login',
          ),
        ),
      );

      //Assert
      expect(
        () => loginDatasource.doLogin(loginRequestEntity: loginRequestEntity),
        throwsA(DataSourceLoginFailure(errorMessage: 'Login incorreto')),
      );

      verify(
        (() => dio.post(
              'https://carros-springboot.herokuapp.com/api/v2/login',
              data: mapRequest,
            )),
      ).called(1);

      verifyNoMoreInteractions(dio);
    });

    test(
        'Lancar um excessão do tipo NoInternetLoginFailure quando o dio der throw em um DioError e o tipo do dioErrorType indicar um time out  ',
        () {
      //Arrange

      when(
        () => dio.post(any(), data: mapRequest),
      ).thenThrow(DioError(
          requestOptions: RequestOptions(
            path: 'https://carros-springboot.herokuapp.com/api/v2/login',
          ),
          type: DioErrorType.connectTimeout));

      //Assert
      expect(
        () => loginDatasource.doLogin(loginRequestEntity: loginRequestEntity),
        throwsA(NoInternetLoginFailure()),
      );

      verify(
        (() => dio.post(
              'https://carros-springboot.herokuapp.com/api/v2/login',
              data: mapRequest,
            )),
      ).called(1);

      verifyNoMoreInteractions(dio);
    });

  });
}
