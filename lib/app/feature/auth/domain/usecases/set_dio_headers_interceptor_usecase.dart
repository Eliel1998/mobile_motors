// ignore_for_file: list_remove_unrelated_type

import 'package:dio/dio.dart';
import 'package:mobile_motors/app/core/interceptor/hearders_interceptor.dart';

class SetDioHeadersInterceptorUsecaseImpl{
  final Dio dio;

  SetDioHeadersInterceptorUsecaseImpl(this.dio);

  void call(String token){
    dio.interceptors.add(HeaderInterceptor(token));
  }

  void removeInterceptors(){
    dio.interceptors.remove('Authorization');
  }
}