import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_motors/app/feature/cars/domain/entities/car_entity.dart';
import 'package:mobile_motors/app/feature/cars/external/mappers/car_entity_mapper.dart';

void main() {
  group('fromMap', () {
    test(
        '''Deve retornar um CarEntity com o parâmetro posterImageUrl = map["poster_path"] concatenada com url base do IMDB,
         convertendo o Map<String, dynamic> com todos os campos não nulos''',
        () {
      //Arrange
      final map = {
        'id': 1,
        'descricao': 'description',
        'latitude': '1.0',
        'longitude': '1.0',
        'nome': 'name',
        'tipo': 'type',
        'urlFoto': 'urlPhoto',
        'urlVideo': 'urlVideo',
      };

      //Act
      final result = CarEntityMapper.fromMap(map: map);

      //Assert
      expect(
        result,
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
      );
    });

    test(
        '''Deve retornar um CarEntity com o parâmetro posterImageUrl = map["poster_path"] concatenada com url base do IMDB,
         convertendo o Map<String, dynamic> com a chave "vote_average" igual a null''',
        () {
      //Arrange
      final map = {
        'id': 1,
        'descricao': 'description',
        'latitude': '1.0',
        'longitude': '1.0',
        'nome': 'name',
        'tipo': 'type',
        'urlFoto': 'urlPhoto',
        'urlVideo': 'urlVideo',
      };

      //Act
      final result = CarEntityMapper.fromMap(map: map);

      //Assert
      expect(
        result,
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
      );
    });

    test(
        '''Deve retornar um CarEntity com o parâmetro posterImageUrl = map["poster_path"] concatenada com url base do IMDB,
         convertendo o Map<String, dynamic> com a chave "vote_average" igual a um int''',
        () {
      //Arrange
      final map = {
        'id': 1,
        'descricao': 'description',
        'latitude': '1.0',
        'longitude': '1.0',
        'nome': 'name',
        'tipo': 'type',
        'urlFoto': 'urlPhoto',
        'urlVideo': 'urlVideo',
      };

      //Act
      final result = CarEntityMapper.fromMap(map: map);

      //Assert
      expect(
        result,
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
      );
    });
  });
}
