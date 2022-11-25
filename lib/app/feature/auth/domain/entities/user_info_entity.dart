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
}
