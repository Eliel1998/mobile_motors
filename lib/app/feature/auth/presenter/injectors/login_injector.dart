import 'package:dio/dio.dart';
import 'package:mobile_motors/app/core/injector/injector.dart';
import 'package:mobile_motors/app/core/localstorage/local_storage.dart';
import 'package:mobile_motors/app/feature/auth/domain/usecases/do_login_usecase.dart';
import 'package:mobile_motors/app/feature/auth/domain/usecases/save_user_token_usecase.dart';
import 'package:mobile_motors/app/feature/auth/infra/repositories/login_repository_impl.dart';

import '../../../../core/navigator/navigator.dart';
import '../../domain/usecases/do_logout_usecase.dart';
import '../../domain/usecases/set_dio_headers_interceptor_usecase.dart';
import '../../external/datasource/login_datasource_impl.dart';
import '../controller/login_controller.dart';
import '../store/login_store.dart';

class LoginInjector extends Injector{
  LoginInjector(super.getItInstance);

  @override
  void controllers() {
    registerFactory(() => LoginController(usecase: get<DoLoginUseCaseImpl>(), store: get<LoginStore>(),navigator: get<AppNavigator>(),saveUserTokenUseCase: get<SaveUserTokenUseCaseImpl>(),setDioHeardersInterceptorUsecase: get<SetDioHeadersInterceptorUsecaseImpl>(),doLogoutUseCase: get<DoLogoutUsecaseImpl>()));
  }

  @override
  void core() {
    // TODO: implement core
  }

  @override
  void datasources() {
    registerFactory(() => LoginDatasourceImpl(dio: get<Dio>(),storage: get<LocalStorage>(),setDioHeadersInterceptorUsecase: get<SetDioHeadersInterceptorUsecaseImpl>()));
  }

  @override
  void repositories() {
    registerFactory(() => LoginRepositoryImpl(datasource: get<LoginDatasourceImpl>()));
  }

  @override
  void stores() {
    registerSingleton(LoginStore());
  }

  @override
  void usecases() {
    registerFactory(() => DoLoginUseCaseImpl(repository: get<LoginRepositoryImpl>()));
    registerFactory(() => SaveUserTokenUseCaseImpl(get<LoginRepositoryImpl>()));
    registerFactory(() => SetDioHeadersInterceptorUsecaseImpl(get<Dio>()));
    registerFactory(() => DoLogoutUsecaseImpl(repository: get<LoginRepositoryImpl>()));
  }
}