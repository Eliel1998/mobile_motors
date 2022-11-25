import '../../domain/entities/user_info_entity.dart';

class UserInfoEntityMapper {
  static UserInfoEntity fromMap({required Map<String, dynamic> map}) {
    return UserInfoEntity(
      id: map['id'],
      login: map['login'],
      name: map['nome'],
      email: map['email'],
      urlPhoto: map['urlFoto'],
      token: map['token'],
      roles: map['roles'],
    );
  }
}
