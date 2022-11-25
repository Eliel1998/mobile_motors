import '../../domain/entities/car_entity.dart';

class CarEntityMapper {
  static CarEntity fromMap({required Map<String, dynamic> map}) {
    return CarEntity(
      id: map['id'],
      name: map['nome'],
      type: map['tipo'],
      description: map['descricao'],
      urlPhoto: map['urlFoto'],
      urlVideo: map['urlVideo'],
      latitude: map['latitude'],
      longitude: map['longitude'],
    );
  }
}
