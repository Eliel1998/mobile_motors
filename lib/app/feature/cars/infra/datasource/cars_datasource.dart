import '../../domain/entities/car_entity.dart';

abstract class CarsDatasource {
  Future<List<CarEntity>> getCars();
}
