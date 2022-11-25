import 'package:mobile_motors/app/feature/cars/domain/entities/car_entity.dart';
import 'package:mobile_motors/app/feature/cars/infra/datasource/cars_datasource.dart';

import '../../domain/failures/failures.dart';
import '../../domain/repositories/cars_repository.dart';

class CarsRepositoryImpl implements CarsRepository{
  final CarsDatasource _datasource;

  CarsRepositoryImpl(this._datasource);

  @override
  Future<List<CarEntity>> getCars() async{
    try{
      return await _datasource.getCars();
    } on CarFailure {
      rethrow;
    } catch (error, stackTrace) {
      throw UnknownCarFailure(
        stackTrace: stackTrace,
        label: 'CarsRepositoryImpl - getCars',
      );
    }
  }

}