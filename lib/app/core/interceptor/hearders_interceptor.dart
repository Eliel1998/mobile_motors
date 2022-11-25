import 'package:dio/dio.dart';

class HeaderInterceptor extends Interceptor{
  final String token;

  HeaderInterceptor(this.token);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] = 'Bearer $token';
    super.onRequest(options, handler);
  }
}