class CarEntity {
  final int id;
  final String name;
  final String type;
  final String description;
  final String? urlPhoto;
  final String? urlVideo;
  final String? latitude;
  final String? longitude;

  CarEntity({
    required this.id,
    required this.name,
    required this.type,
    required this.description,
    required this.urlPhoto,
    required this.urlVideo,
    required this.latitude,
    required this.longitude,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CarEntity &&
        other.id == id &&
        other.name == name &&
        other.type == type &&
        other.description == description &&
        other.urlPhoto == urlPhoto &&
        other.urlVideo == urlVideo &&
        other.latitude == latitude &&
        other.longitude == longitude;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        type.hashCode ^
        description.hashCode ^
        urlPhoto.hashCode ^
        urlVideo.hashCode ^
        latitude.hashCode ^
        longitude.hashCode;
  }
}
