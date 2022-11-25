import '../entities/car_entity.dart';
import '../repositories/cars_repository.dart';

abstract class GetCarsUseCase {
  Future<List<CarEntity>> call();
}

class GetCarsUseCaseImpl implements GetCarsUseCase {
  final CarsRepository _repository;

  GetCarsUseCaseImpl(this._repository);

  @override
  Future<List<CarEntity>> call() async {
    return await _repository.getCars();
  }
}