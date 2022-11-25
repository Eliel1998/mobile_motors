import 'package:mobile_motors/app/feature/cars/domain/entities/car_entity.dart';
import 'package:mobile_motors/app/feature/cars/domain/usecases/get_cars_usecase.dart';
import 'package:mobile_motors/app/feature/cars/presenter/store/car_store.dart';

class CarController{
  final GetCarsUseCase usecase;
  final CarStore store;

  CarController({required this.usecase, required this.store});

  void getCars() async{
    List<CarEntity> cars = await usecase.call();
    store.setCars(cars);
  }
}