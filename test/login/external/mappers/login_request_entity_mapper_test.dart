import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_motors/app/feature/auth/domain/entities/login_request_entity.dart';
import 'package:mobile_motors/app/feature/auth/external/mappers/login_request_entity_mapper.dart';

void main() {
  group('toMap', () {
    test(
        'Verifica se retorna um Map a partir de uma entidade passando os respectivos parametros',
        () {
      //Arrange
      final LoginRequestEntity entity =
          LoginRequestEntity(email: 'teste', password: 'teste');
      //Act
      final result = LoginRequestEntityMapper.toMap(entity: entity);

      //Assert
      expect(result, <String, dynamic>{
        'username': 'teste',
        'password': 'teste',
      });
    });
  });
}
