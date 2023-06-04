import 'package:freezed_annotation/freezed_annotation.dart';

part 'mars_photos.freezed.dart';
part 'mars_photos.g.dart';

@freezed
class MarsPhotos with _$MarsPhotos {
  const factory MarsPhotos({
    required List<Photo> photos,
  }) = _MarsPhotos;

  factory MarsPhotos.fromJson(Map<String, dynamic> json) => _$MarsPhotosFromJson(json);
}

@freezed
class Photo with _$Photo {
  const factory Photo({
    int? id,
    int? sol,
    Camera? camera,
    @JsonKey(name: 'img_src') String? imgSrc,
    @JsonKey(name: 'earth_date') DateTime? earthDate,
    Rover? rover,
  }) = _Photo;

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);
}

@freezed
class Camera with _$Camera {
  const factory Camera({
    int? id,
    String? name,
    @JsonKey(name: 'rover_id') int? roverId,
    @JsonKey(name: 'full_name') String? fullName,
  }) = _Camera;

  factory Camera.fromJson(Map<String, dynamic> json) => _$CameraFromJson(json);
}

@freezed
class Rover with _$Rover {
  const factory Rover({
    int? id,
    String? name,
    @JsonKey(name: 'landing_date') DateTime? landingDate,
    @JsonKey(name: 'launch_date') DateTime? launchDate,
    String? status,
  }) = _Rover;

  factory Rover.fromJson(Map<String, dynamic> json) => _$RoverFromJson(json);
}
