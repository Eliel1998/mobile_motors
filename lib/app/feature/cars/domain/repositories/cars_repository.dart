import 'package:mobile_motors/app/feature/cars/domain/entities/car_entity.dart';

abstract class CarsRepository{
  Future<List<CarEntity>> getCars();
}