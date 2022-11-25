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
}
