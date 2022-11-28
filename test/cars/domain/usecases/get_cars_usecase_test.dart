
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_motors/app/feature/cars/domain/entities/car_entity.dart';
import 'package:mobile_motors/app/feature/cars/domain/repositories/cars_repository.dart';
import 'package:mobile_motors/app/feature/cars/domain/usecases/get_cars_usecase.dart';
import 'package:mocktail/mocktail.dart';

class CarsRepositoryMock extends Mock implements CarsRepository {}

void main() {
  late CarsRepositoryMock carsRepositoryMock;

  late GetCarsUseCase getCarsUsecase;

  setUp(() {
    carsRepositoryMock = CarsRepositoryMock();
    getCarsUsecase =
        GetCarsUseCaseImpl(carsRepositoryMock);
  });

  test(
      'Deve retornar List<CarEntity> quando a chamada para o repositório for sucedida',
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

    when(() => carsRepositoryMock.getCars()).thenAnswer(
      (_) async => response,
    );

    //Act
    final result = await getCarsUsecase.call();

    //Assert
    expect(result, response);
  });
}
