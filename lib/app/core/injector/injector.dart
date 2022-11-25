import 'package:get_it/get_it.dart';

abstract class Injector {
  Injector(this.getItInstance);
  final GetIt getItInstance;

  void core();
  void datasources();
  void repositories();
  void usecases();
  void stores();
  void controllers();

  void register() {
    core();
    datasources();
    repositories();
    usecases();
    stores();
    controllers();
  }

  void registerFactory<T extends Object>(T Function() factoryFunc) {
    getItInstance.registerFactory<T>(factoryFunc);
  }

  void registerSingleton<T extends Object>(T instance) {
    getItInstance.registerSingleton<T>(instance);
  }

  void registerLazySingleton<T extends Object>(T Function() factoryFunc) {
    getItInstance.registerLazySingleton<T>(factoryFunc);
  }

  T get<T extends Object>() {
    return getItInstance.get<T>();
  }
}