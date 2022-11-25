import 'package:dio/dio.dart';
import 'package:mobile_motors/app/feature/cars/presenter/controller/car_controller.dart';

import '../../../../core/injector/injector.dart';
import '../../domain/usecases/get_cars_usecase.dart';
import '../../external/datasource/cars_datasource_impl.dart';
import '../../infra/repositories/cars_repository_impl.dart';
import '../store/car_store.dart';

class CarInjector extends Injector{
  CarInjector(super.getItInstance);

  @override
  void controllers() {
    registerFactory(() => CarController(usecase: get<GetCarsUseCaseImpl>(), store: get<CarStore>()));
  }

  @override
  void core() {
    // TODO: implement core
  }

  @override
  void datasources() {
    registerFactory(() => CarsDatasourceImpl(dio: get<Dio>()));
  }

  @override
  void repositories() {
    registerFactory(() => CarsRepositoryImpl(get<CarsDatasourceImpl>()));
  }

  @override
  void stores() {
    registerSingleton(CarStore());
  }

  @override
  void usecases() {
    registerFactory(() => GetCarsUseCaseImpl(get<CarsRepositoryImpl>()));
  }
}