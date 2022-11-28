import 'package:flutter/foundation.dart';

class UserInfoEntity {
  final int id;
  final String login;
  final String name;
  final String email;
  final String urlPhoto;
  final String token;
  final List roles;

  UserInfoEntity({
    required this.id,
    required this.login,
    required this.name,
    required this.email,
    required this.urlPhoto,
    required this.token,
    required this.roles,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserInfoEntity &&
        other.id == id &&
        other.login == login &&
        other.name == name &&
        other.email == email &&
        other.urlPhoto == urlPhoto &&
        other.token == token &&
        listEquals(other.roles, roles);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        login.hashCode ^
        name.hashCode ^
        email.hashCode ^
        urlPhoto.hashCode ^
        token.hashCode ^
        roles.hashCode;
  }
}
