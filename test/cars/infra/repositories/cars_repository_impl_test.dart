import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_motors/app/feature/cars/domain/entities/car_entity.dart';
import 'package:mobile_motors/app/feature/cars/domain/failures/failures.dart';
import 'package:mobile_motors/app/feature/cars/domain/repositories/cars_repository.dart';
import 'package:mobile_motors/app/feature/cars/infra/datasource/cars_datasource.dart';
import 'package:mobile_motors/app/feature/cars/infra/repositories/cars_repository_impl.dart';
import 'package:mocktail/mocktail.dart';

class CarsDatasourceMock extends Mock implements CarsDatasource {}

void main() {
  late CarsDatasourceMock carsDatasourceMock;

  late CarsRepository carsRepository;

  setUp(() {
    carsDatasourceMock = CarsDatasourceMock();
    carsRepository = CarsRepositoryImpl(
      carsDatasourceMock,
    );
  });

  test(
      'Deve retornar List<CarEntity> quando a chamada para o datasource for sucedida',
      () async {
    //Arrange
    final response = <CarEntity>[
        CarEntity(
        id: 1,
        description: 'description',
        latitude: '1.0',
        longitude: '1.0',
        name: 'name',
        type: 'type',
        urlPhoto: 'urlPhoto',
        urlVideo: 'urlVideo',
      ),
    ];

    when(() => carsDatasourceMock.getCars()).thenAnswer(
      (_) async => response,
    );

    //Act
    final result = await carsRepository.getCars();

    //Assert
    expect(result, response);
  });

  test(
      'Deve dar rethrow na falha lançada pelo datasource quando o mesmo lançar um subtipo de CarFailure',
      () async {
    //Arrange
    when(() => carsDatasourceMock.getCars()).thenThrow(
      NoInternetCarFailure(),
    );

    //Assert
    expect(
      () => carsRepository.getCars(),
      throwsA(
        NoInternetCarFailure(),
      ),
    );
  });

  test(
      'Deve dar throw em UnknownCarFailure quando o datasource lançar uma exceção que não seja um subtipo de CarFailure',
      () async {
    //Arrange
    when(() => carsDatasourceMock.getCars()).thenThrow(
      Exception(),
    );

    //Assert
    expect(
      () => carsRepository.getCars(),
      throwsA(
        UnknownCarFailure(),
      ),
    );
  });
}
