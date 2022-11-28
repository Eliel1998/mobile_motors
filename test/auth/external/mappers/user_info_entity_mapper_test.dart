import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_motors/app/feature/auth/domain/entities/user_info_entity.dart';
import 'package:mobile_motors/app/feature/auth/external/mappers/user_info_entity_mapper.dart';

void main() {
  group('fromMap', () {
    test(
        'Verifica se retorna um UserInfoEntity a partir de uma map passando os respectivos parametros',
        () {
      //Arrange
      final Map<String, dynamic> map = {
        'id': 3,
        'login': 'user',
        'nome': 'User',
        'email': 'user@gmail.com',
        'urlFoto':'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQqP85ZnOcRSCX3nlYdkCvSxhSuZs0bLt1He8EvGr5ne8c7mTqW',
        'token': 'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJ1c2VyIiwiZXhwIjoxNjUwMjAyNjMwLCJyb2wiOlsiUk9MRV9VU0VSIl19.Tlt56L_DlNlqWbtBCAVT1HU4sRncuH3WFgICJjwHufTTvuICJBFXjnnP3-9_pHlQ_2m1QqWdbQXjc9TBHtY8mw',
        'roles': ['ROLE_USER']
      };

      //Act
      final UserInfoEntity result = UserInfoEntityMapper.fromMap(map: map);

      //Assert
      expect(
        UserInfoEntity(
          id: map['id'],
          login: map['login'],
          name: map['nome'],
          email: map['email'],
          urlPhoto: map['urlFoto'],
          token: map['token'],
          roles: map['roles'],
        ),
        result,
      );
    });
  });
}
