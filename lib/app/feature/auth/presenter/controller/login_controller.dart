import 'package:mobile_motors/app/core/navigator/navigator.dart';
import 'package:mobile_motors/app/feature/auth/domain/entities/login_request_entity.dart';
import 'package:mobile_motors/app/feature/auth/domain/usecases/do_login_usecase.dart';
import 'package:mobile_motors/app/feature/auth/domain/usecases/do_logout_usecase.dart';
import 'package:mobile_motors/app/feature/auth/domain/usecases/save_user_token_usecase.dart';
import 'package:mobile_motors/app/feature/auth/domain/usecases/set_dio_headers_interceptor_usecase.dart';
import 'package:mobile_motors/app/feature/auth/presenter/store/login_store.dart';

class LoginController{
  final DoLoginUseCase usecase;
  final LoginStore store;
  final AppNavigator navigator;
  final SaveUserTokenUseCaseImpl saveUserTokenUseCase;
  final SetDioHeadersInterceptorUsecaseImpl setDioHeardersInterceptorUsecase;
  final DoLogoutUsecaseImpl doLogoutUseCase;

  LoginController({required this.usecase, required this.store, required this.navigator, required this.saveUserTokenUseCase, required this.setDioHeardersInterceptorUsecase, required this.doLogoutUseCase});

  void doLogin() async{
    LoginRequestEntity request = LoginRequestEntity(email: store.emailController.text, password: store.passwordController.text);
    store.isLoading.value = true;

    final response = await usecase.call(loginRequestEntity: request);

    response.fold((left){
      store.isLoading.value = false;
    }, 
    (right)async{

      setDioHeardersInterceptorUsecase.call(right.token);
      await saveUserTokenUseCase.save(token: right.token);
      navigator.pushReplacementNamed(routeName: '/CarsPage');
      store.isLoading.value = false;
      store.emailController.clear();
      store.passwordController.clear();
      
    });
  }

  void logout() async{
    await doLogoutUseCase.call();
    navigator.pushReplacementNamed(routeName: '/login');
  }

  
}