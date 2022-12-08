import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_motors/app/core/localstorage/local_storage.dart';
import 'package:mobile_motors/app/core/navigator/navigator.dart';
import 'package:mobile_motors/app/feature/app_init/controller/init_controller.dart';
import 'package:mobile_motors/app/feature/auth/presenter/injectors/login_injector.dart';
import 'package:mobile_motors/app/feature/auth/presenter/pages/login_page.dart';
import 'package:mobile_motors/app/feature/cars/presenter/injectors/car_injector.dart';
import 'package:mobile_motors/app/feature/cars/presenter/pages/cars_page.dart';
import 'app/feature/app_init/pages/init_page.dart';
import 'app/feature/auth/domain/usecases/set_dio_headers_interceptor_usecase.dart';

void main() {
  GetIt getIt = GetIt.instance;
  GetIt.I.registerSingleton<Dio>(Dio());
  GetIt.I.registerSingleton<AppNavigator>(AppNavigator());
  GetIt.I.registerSingleton<LocalStorage>(LocalStorage());
  GetIt.I.registerFactory<InitController>(() => InitController(navigator: GetIt.I.get<AppNavigator>(),storage: GetIt.I.get<LocalStorage>(),setDioHeadersInterceptorUseCase: SetDioHeadersInterceptorUsecaseImpl(GetIt.I.get<Dio>()),dio: GetIt.I.get<Dio>()));
  CarInjector(getIt).register();
  LoginInjector(getIt).register();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: GetIt.I.get<AppNavigator>().navigatorKey,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Scaffold(body: LoginPage()),
      initialRoute: InitPage.routeName,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case LoginPage.routeName:
            return MaterialPageRoute(builder: (_) => const LoginPage());

          case CarsPage.routeName:
            return MaterialPageRoute(builder: (_) => const CarsPage());

          default:
            return MaterialPageRoute(builder: (_) => const InitPage());
        }
      },
    );
  }
}
