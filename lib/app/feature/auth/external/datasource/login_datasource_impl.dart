import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:mobile_motors/app/core/localstorage/local_storage.dart';
import 'package:mobile_motors/app/feature/auth/domain/entities/login_request_entity.dart';
import 'package:mobile_motors/app/feature/auth/domain/entities/user_info_entity.dart';
import 'package:mobile_motors/app/feature/auth/domain/usecases/set_dio_headers_interceptor_usecase.dart';
import 'package:mobile_motors/app/feature/auth/external/mappers/login_request_entity_mapper.dart';
import 'package:mobile_motors/app/feature/auth/external/mappers/user_info_entity_mapper.dart';

import '../../../../core/failures/failure.dart';
import '../../domain/failures/login_failure.dart';
import '../../infra/datasource/login_datasource.dart';

class LoginDatasourceImpl implements LoginDatasource {
  final Dio _dio;
  final LocalStorage storage;
  final SetDioHeadersInterceptorUsecaseImpl setDioHeadersInterceptorUsecase;
  static const path = 'user-token';
  static const key = 'token';

  LoginDatasourceImpl({ required Dio dio,required this.storage,required this.setDioHeadersInterceptorUsecase}) : _dio = dio;

  @override
  Future<Either<Failure, UserInfoEntity>>doLogin({required LoginRequestEntity loginRequestEntity}) async {
    try {
      final Response result = await _dio.post(
          'https://carros-springboot.herokuapp.com/api/v2/login',
          data: LoginRequestEntityMapper.toMap(
            entity: loginRequestEntity,
          ));
      if (result.statusCode == 200) {
        
        final UserInfoEntity userInfoEntity = UserInfoEntityMapper.fromMap(map: result.data);
        debugPrint('Veio aqui token: ${userInfoEntity.token}');
        return Right(userInfoEntity);

      } else {
        throw DataSourceLoginFailure(errorMessage: result.data!['error']);
      }
    } on DioError catch (error, stackTrace) {
      final List<DioErrorType> dioErrorTypes = [
        DioErrorType.connectTimeout,
        DioErrorType.receiveTimeout,
        DioErrorType.sendTimeout,
      ];
      if (dioErrorTypes.contains(error.type)) {
        throw NoInternetLoginFailure(
          stackTrace: stackTrace,
          label: 'LoginDatasourceImpl - doLogin',
        );
      } else {
        return Left(UnknownLoginFailure(
          stackTrace: stackTrace,
          label: 'LoginDatasourceImpl - doLogin',
        ));
      }
    }
  }
  
  @override
  Future<void> saveUserToken({ required String token}) async {
    storage.save(path: path, key: key, value: token);
  }
  
  @override
  Future<void> logout() async{
    print('Logout manolooo');
    setDioHeadersInterceptorUsecase.removeInterceptors();
    storage.delete(path: path, key: key);
  }

}
