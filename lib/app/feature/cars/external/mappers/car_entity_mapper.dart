import '../../domain/entities/car_entity.dart';

class CarEntityMapper {
  static CarEntity fromMap({required Map<String, dynamic> map}) {
    return CarEntity(
      id: map['id'],
      description: map['descricao'],
      latitude: map['latitude'],
      longitude: map['longitude'],
      name: map['nome'],
      type: map['tipo'],
      urlPhoto: map['urlFoto'],
      urlVideo: map['urlVideo'],
    );
  }
}
