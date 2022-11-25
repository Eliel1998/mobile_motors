import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobile_motors/app/core/localstorage/local_storage.dart';
import 'package:mobile_motors/app/feature/cars/presenter/pages/cars_page.dart';
import '../../../core/navigator/navigator.dart';
import '../../auth/domain/usecases/set_dio_headers_interceptor_usecase.dart';
import '../../auth/presenter/pages/login_page.dart';

class InitController{
  final AppNavigator navigator;
  final LocalStorage storage;
  final SetDioHeadersInterceptorUsecaseImpl setDioHeadersInterceptorUseCase;
  final Dio dio;

  InitController({required this.navigator, required this.storage, required this.setDioHeadersInterceptorUseCase, required this.dio});

  Future<void> init() async {
   await Future.wait( [
      storage.init(),
      Future.delayed(const Duration(seconds: 2))
    ]);

    final token = await storage.get(path: 'user-token', key: 'token');

    if(token !=null && token.isNotEmpty){
      setDioHeadersInterceptorUseCase.call(token);
      navigator.pushReplacementNamed(routeName: CarsPage.routeName);
    }else{
      navigator.pushReplacementNamed(routeName: LoginPage.routeName);
    }
  }
}