// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mars_photos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MarsPhotos _$$_MarsPhotosFromJson(Map<String, dynamic> json) =>
    _$_MarsPhotos(
      photos: (json['photos'] as List<dynamic>)
          .map((e) => Photo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_MarsPhotosToJson(_$_MarsPhotos instance) =>
    <String, dynamic>{
      'photos': instance.photos,
    };

_$_Photo _$$_PhotoFromJson(Map<String, dynamic> json) => _$_Photo(
      id: json['id'] as int?,
      sol: json['sol'] as int?,
      camera: json['camera'] == null
          ? null
          : Camera.fromJson(json['camera'] as Map<String, dynamic>),
      imgSrc: json['img_src'] as String?,
      earthDate: json['earth_date'] == null
          ? null
          : DateTime.parse(json['earth_date'] as String),
      rover: json['rover'] == null
          ? null
          : Rover.fromJson(json['rover'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_PhotoToJson(_$_Photo instance) => <String, dynamic>{
      'id': instance.id,
      'sol': instance.sol,
      'camera': instance.camera,
      'img_src': instance.imgSrc,
      'earth_date': instance.earthDate?.toIso8601String(),
      'rover': instance.rover,
    };

_$_Camera _$$_CameraFromJson(Map<String, dynamic> json) => _$_Camera(
      id: json['id'] as int?,
      name: json['name'] as String?,
      roverId: json['rover_id'] as int?,
      fullName: json['full_name'] as String?,
    );

Map<String, dynamic> _$$_CameraToJson(_$_Camera instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'rover_id': instance.roverId,
      'full_name': instance.fullName,
    };

_$_Rover _$$_RoverFromJson(Map<String, dynamic> json) => _$_Rover(
      id: json['id'] as int?,
      name: json['name'] as String?,
      landingDate: json['landing_date'] == null
          ? null
          : DateTime.parse(json['landing_date'] as String),
      launchDate: json['launch_date'] == null
          ? null
          : DateTime.parse(json['launch_date'] as String),
      status: json['status'] as String?,
    );

Map<String, dynamic> _$$_RoverToJson(_$_Rover instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'landing_date': instance.landingDate?.toIso8601String(),
      'launch_date': instance.launchDate?.toIso8601String(),
      'status': instance.status,
    };
