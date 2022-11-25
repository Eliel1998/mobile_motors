import 'package:dio/dio.dart';
import 'package:mobile_motors/app/feature/cars/infra/datasource/cars_datasource.dart';

import '../../domain/entities/car_entity.dart';
import '../../domain/failures/failures.dart';
import '../mappers/car_entity_mapper.dart';

class CarsDatasourceImpl implements CarsDatasource {
  final Dio _dio;

  CarsDatasourceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<List<CarEntity>> getCars() async {
    List<CarEntity> cars = [];
    try {
      final Response result = await _dio.get('https://carros-springboot.herokuapp.com/api/v2/carros');
      if (result.statusCode == 200) {
        final List<dynamic> carsMap = result.data;
        for (var carMap in carsMap) {
          CarEntity car = CarEntityMapper.fromMap(map: carMap);
          cars.add(car);
        }
      } else {
        throw DataSourceCarFailure(
          errorMessage: result.data!['status_message'],
        );
      }
    } on DioError catch (error, stackTrace) {
      final List<DioErrorType> dioErrorTypes = [
        DioErrorType.connectTimeout,
        DioErrorType.receiveTimeout,
        DioErrorType.sendTimeout,
      ];
      if (dioErrorTypes.contains(error.type)) {
        throw NoInternetCarFailure(
          stackTrace: stackTrace,
          label: 'CarsDatasourceImpl - getCars',
        );
      } else {
        throw UnknownCarFailure(
          stackTrace: stackTrace,
          label: 'CarsDatasourceImpl - getCars',
        );
      }
    }

    return cars;
  }
}
