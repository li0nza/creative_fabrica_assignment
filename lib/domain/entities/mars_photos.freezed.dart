// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mars_photos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MarsPhotos _$MarsPhotosFromJson(Map<String, dynamic> json) {
  return _MarsPhotos.fromJson(json);
}

/// @nodoc
mixin _$MarsPhotos {
  List<Photo> get photos => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MarsPhotosCopyWith<MarsPhotos> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarsPhotosCopyWith<$Res> {
  factory $MarsPhotosCopyWith(
          MarsPhotos value, $Res Function(MarsPhotos) then) =
      _$MarsPhotosCopyWithImpl<$Res, MarsPhotos>;
  @useResult
  $Res call({List<Photo> photos});
}

/// @nodoc
class _$MarsPhotosCopyWithImpl<$Res, $Val extends MarsPhotos>
    implements $MarsPhotosCopyWith<$Res> {
  _$MarsPhotosCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? photos = null,
  }) {
    return _then(_value.copyWith(
      photos: null == photos
          ? _value.photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<Photo>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MarsPhotosCopyWith<$Res>
    implements $MarsPhotosCopyWith<$Res> {
  factory _$$_MarsPhotosCopyWith(
          _$_MarsPhotos value, $Res Function(_$_MarsPhotos) then) =
      __$$_MarsPhotosCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Photo> photos});
}

/// @nodoc
class __$$_MarsPhotosCopyWithImpl<$Res>
    extends _$MarsPhotosCopyWithImpl<$Res, _$_MarsPhotos>
    implements _$$_MarsPhotosCopyWith<$Res> {
  __$$_MarsPhotosCopyWithImpl(
      _$_MarsPhotos _value, $Res Function(_$_MarsPhotos) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? photos = null,
  }) {
    return _then(_$_MarsPhotos(
      photos: null == photos
          ? _value._photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<Photo>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MarsPhotos implements _MarsPhotos {
  const _$_MarsPhotos({required final List<Photo> photos}) : _photos = photos;

  factory _$_MarsPhotos.fromJson(Map<String, dynamic> json) =>
      _$$_MarsPhotosFromJson(json);

  final List<Photo> _photos;
  @override
  List<Photo> get photos {
    if (_photos is EqualUnmodifiableListView) return _photos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_photos);
  }

  @override
  String toString() {
    return 'MarsPhotos(photos: $photos)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MarsPhotos &&
            const DeepCollectionEquality().equals(other._photos, _photos));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_photos));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MarsPhotosCopyWith<_$_MarsPhotos> get copyWith =>
      __$$_MarsPhotosCopyWithImpl<_$_MarsPhotos>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MarsPhotosToJson(
      this,
    );
  }
}

abstract class _MarsPhotos implements MarsPhotos {
  const factory _MarsPhotos({required final List<Photo> photos}) =
      _$_MarsPhotos;

  factory _MarsPhotos.fromJson(Map<String, dynamic> json) =
      _$_MarsPhotos.fromJson;

  @override
  List<Photo> get photos;
  @override
  @JsonKey(ignore: true)
  _$$_MarsPhotosCopyWith<_$_MarsPhotos> get copyWith =>
      throw _privateConstructorUsedError;
}

Photo _$PhotoFromJson(Map<String, dynamic> json) {
  return _Photo.fromJson(json);
}

/// @nodoc
mixin _$Photo {
  int? get id => throw _privateConstructorUsedError;
  int? get sol => throw _privateConstructorUsedError;
  Camera? get camera => throw _privateConstructorUsedError;
  @JsonKey(name: 'img_src')
  String? get imgSrc => throw _privateConstructorUsedError;
  @JsonKey(name: 'earth_date')
  DateTime? get earthDate => throw _privateConstructorUsedError;
  Rover? get rover => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PhotoCopyWith<Photo> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhotoCopyWith<$Res> {
  factory $PhotoCopyWith(Photo value, $Res Function(Photo) then) =
      _$PhotoCopyWithImpl<$Res, Photo>;
  @useResult
  $Res call(
      {int? id,
      int? sol,
      Camera? camera,
      @JsonKey(name: 'img_src') String? imgSrc,
      @JsonKey(name: 'earth_date') DateTime? earthDate,
      Rover? rover});

  $CameraCopyWith<$Res>? get camera;
  $RoverCopyWith<$Res>? get rover;
}

/// @nodoc
class _$PhotoCopyWithImpl<$Res, $Val extends Photo>
    implements $PhotoCopyWith<$Res> {
  _$PhotoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? sol = freezed,
    Object? camera = freezed,
    Object? imgSrc = freezed,
    Object? earthDate = freezed,
    Object? rover = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      sol: freezed == sol
          ? _value.sol
          : sol // ignore: cast_nullable_to_non_nullable
              as int?,
      camera: freezed == camera
          ? _value.camera
          : camera // ignore: cast_nullable_to_non_nullable
              as Camera?,
      imgSrc: freezed == imgSrc
          ? _value.imgSrc
          : imgSrc // ignore: cast_nullable_to_non_nullable
              as String?,
      earthDate: freezed == earthDate
          ? _value.earthDate
          : earthDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      rover: freezed == rover
          ? _value.rover
          : rover // ignore: cast_nullable_to_non_nullable
              as Rover?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CameraCopyWith<$Res>? get camera {
    if (_value.camera == null) {
      return null;
    }

    return $CameraCopyWith<$Res>(_value.camera!, (value) {
      return _then(_value.copyWith(camera: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $RoverCopyWith<$Res>? get rover {
    if (_value.rover == null) {
      return null;
    }

    return $RoverCopyWith<$Res>(_value.rover!, (value) {
      return _then(_value.copyWith(rover: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_PhotoCopyWith<$Res> implements $PhotoCopyWith<$Res> {
  factory _$$_PhotoCopyWith(_$_Photo value, $Res Function(_$_Photo) then) =
      __$$_PhotoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? sol,
      Camera? camera,
      @JsonKey(name: 'img_src') String? imgSrc,
      @JsonKey(name: 'earth_date') DateTime? earthDate,
      Rover? rover});

  @override
  $CameraCopyWith<$Res>? get camera;
  @override
  $RoverCopyWith<$Res>? get rover;
}

/// @nodoc
class __$$_PhotoCopyWithImpl<$Res> extends _$PhotoCopyWithImpl<$Res, _$_Photo>
    implements _$$_PhotoCopyWith<$Res> {
  __$$_PhotoCopyWithImpl(_$_Photo _value, $Res Function(_$_Photo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? sol = freezed,
    Object? camera = freezed,
    Object? imgSrc = freezed,
    Object? earthDate = freezed,
    Object? rover = freezed,
  }) {
    return _then(_$_Photo(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      sol: freezed == sol
          ? _value.sol
          : sol // ignore: cast_nullable_to_non_nullable
              as int?,
      camera: freezed == camera
          ? _value.camera
          : camera // ignore: cast_nullable_to_non_nullable
              as Camera?,
      imgSrc: freezed == imgSrc
          ? _value.imgSrc
          : imgSrc // ignore: cast_nullable_to_non_nullable
              as String?,
      earthDate: freezed == earthDate
          ? _value.earthDate
          : earthDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      rover: freezed == rover
          ? _value.rover
          : rover // ignore: cast_nullable_to_non_nullable
              as Rover?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Photo implements _Photo {
  const _$_Photo(
      {this.id,
      this.sol,
      this.camera,
      @JsonKey(name: 'img_src') this.imgSrc,
      @JsonKey(name: 'earth_date') this.earthDate,
      this.rover});

  factory _$_Photo.fromJson(Map<String, dynamic> json) =>
      _$$_PhotoFromJson(json);

  @override
  final int? id;
  @override
  final int? sol;
  @override
  final Camera? camera;
  @override
  @JsonKey(name: 'img_src')
  final String? imgSrc;
  @override
  @JsonKey(name: 'earth_date')
  final DateTime? earthDate;
  @override
  final Rover? rover;

  @override
  String toString() {
    return 'Photo(id: $id, sol: $sol, camera: $camera, imgSrc: $imgSrc, earthDate: $earthDate, rover: $rover)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Photo &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.sol, sol) || other.sol == sol) &&
            (identical(other.camera, camera) || other.camera == camera) &&
            (identical(other.imgSrc, imgSrc) || other.imgSrc == imgSrc) &&
            (identical(other.earthDate, earthDate) ||
                other.earthDate == earthDate) &&
            (identical(other.rover, rover) || other.rover == rover));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, sol, camera, imgSrc, earthDate, rover);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PhotoCopyWith<_$_Photo> get copyWith =>
      __$$_PhotoCopyWithImpl<_$_Photo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PhotoToJson(
      this,
    );
  }
}

abstract class _Photo implements Photo {
  const factory _Photo(
      {final int? id,
      final int? sol,
      final Camera? camera,
      @JsonKey(name: 'img_src') final String? imgSrc,
      @JsonKey(name: 'earth_date') final DateTime? earthDate,
      final Rover? rover}) = _$_Photo;

  factory _Photo.fromJson(Map<String, dynamic> json) = _$_Photo.fromJson;

  @override
  int? get id;
  @override
  int? get sol;
  @override
  Camera? get camera;
  @override
  @JsonKey(name: 'img_src')
  String? get imgSrc;
  @override
  @JsonKey(name: 'earth_date')
  DateTime? get earthDate;
  @override
  Rover? get rover;
  @override
  @JsonKey(ignore: true)
  _$$_PhotoCopyWith<_$_Photo> get copyWith =>
      throw _privateConstructorUsedError;
}

Camera _$CameraFromJson(Map<String, dynamic> json) {
  return _Camera.fromJson(json);
}

/// @nodoc
mixin _$Camera {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'rover_id')
  int? get roverId => throw _privateConstructorUsedError;
  @JsonKey(name: 'full_name')
  String? get fullName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CameraCopyWith<Camera> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CameraCopyWith<$Res> {
  factory $CameraCopyWith(Camera value, $Res Function(Camera) then) =
      _$CameraCopyWithImpl<$Res, Camera>;
  @useResult
  $Res call(
      {int? id,
      String? name,
      @JsonKey(name: 'rover_id') int? roverId,
      @JsonKey(name: 'full_name') String? fullName});
}

/// @nodoc
class _$CameraCopyWithImpl<$Res, $Val extends Camera>
    implements $CameraCopyWith<$Res> {
  _$CameraCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? roverId = freezed,
    Object? fullName = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      roverId: freezed == roverId
          ? _value.roverId
          : roverId // ignore: cast_nullable_to_non_nullable
              as int?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CameraCopyWith<$Res> implements $CameraCopyWith<$Res> {
  factory _$$_CameraCopyWith(_$_Camera value, $Res Function(_$_Camera) then) =
      __$$_CameraCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      @JsonKey(name: 'rover_id') int? roverId,
      @JsonKey(name: 'full_name') String? fullName});
}

/// @nodoc
class __$$_CameraCopyWithImpl<$Res>
    extends _$CameraCopyWithImpl<$Res, _$_Camera>
    implements _$$_CameraCopyWith<$Res> {
  __$$_CameraCopyWithImpl(_$_Camera _value, $Res Function(_$_Camera) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? roverId = freezed,
    Object? fullName = freezed,
  }) {
    return _then(_$_Camera(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      roverId: freezed == roverId
          ? _value.roverId
          : roverId // ignore: cast_nullable_to_non_nullable
              as int?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Camera implements _Camera {
  const _$_Camera(
      {this.id,
      this.name,
      @JsonKey(name: 'rover_id') this.roverId,
      @JsonKey(name: 'full_name') this.fullName});

  factory _$_Camera.fromJson(Map<String, dynamic> json) =>
      _$$_CameraFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  @JsonKey(name: 'rover_id')
  final int? roverId;
  @override
  @JsonKey(name: 'full_name')
  final String? fullName;

  @override
  String toString() {
    return 'Camera(id: $id, name: $name, roverId: $roverId, fullName: $fullName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Camera &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.roverId, roverId) || other.roverId == roverId) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, roverId, fullName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CameraCopyWith<_$_Camera> get copyWith =>
      __$$_CameraCopyWithImpl<_$_Camera>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CameraToJson(
      this,
    );
  }
}

abstract class _Camera implements Camera {
  const factory _Camera(
      {final int? id,
      final String? name,
      @JsonKey(name: 'rover_id') final int? roverId,
      @JsonKey(name: 'full_name') final String? fullName}) = _$_Camera;

  factory _Camera.fromJson(Map<String, dynamic> json) = _$_Camera.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  @JsonKey(name: 'rover_id')
  int? get roverId;
  @override
  @JsonKey(name: 'full_name')
  String? get fullName;
  @override
  @JsonKey(ignore: true)
  _$$_CameraCopyWith<_$_Camera> get copyWith =>
      throw _privateConstructorUsedError;
}

Rover _$RoverFromJson(Map<String, dynamic> json) {
  return _Rover.fromJson(json);
}

/// @nodoc
mixin _$Rover {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'landing_date')
  DateTime? get landingDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'launch_date')
  DateTime? get launchDate => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoverCopyWith<Rover> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoverCopyWith<$Res> {
  factory $RoverCopyWith(Rover value, $Res Function(Rover) then) =
      _$RoverCopyWithImpl<$Res, Rover>;
  @useResult
  $Res call(
      {int? id,
      String? name,
      @JsonKey(name: 'landing_date') DateTime? landingDate,
      @JsonKey(name: 'launch_date') DateTime? launchDate,
      String? status});
}

/// @nodoc
class _$RoverCopyWithImpl<$Res, $Val extends Rover>
    implements $RoverCopyWith<$Res> {
  _$RoverCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? landingDate = freezed,
    Object? launchDate = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      landingDate: freezed == landingDate
          ? _value.landingDate
          : landingDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      launchDate: freezed == launchDate
          ? _value.launchDate
          : launchDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RoverCopyWith<$Res> implements $RoverCopyWith<$Res> {
  factory _$$_RoverCopyWith(_$_Rover value, $Res Function(_$_Rover) then) =
      __$$_RoverCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      @JsonKey(name: 'landing_date') DateTime? landingDate,
      @JsonKey(name: 'launch_date') DateTime? launchDate,
      String? status});
}

/// @nodoc
class __$$_RoverCopyWithImpl<$Res> extends _$RoverCopyWithImpl<$Res, _$_Rover>
    implements _$$_RoverCopyWith<$Res> {
  __$$_RoverCopyWithImpl(_$_Rover _value, $Res Function(_$_Rover) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? landingDate = freezed,
    Object? launchDate = freezed,
    Object? status = freezed,
  }) {
    return _then(_$_Rover(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      landingDate: freezed == landingDate
          ? _value.landingDate
          : landingDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      launchDate: freezed == launchDate
          ? _value.launchDate
          : launchDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Rover implements _Rover {
  const _$_Rover(
      {this.id,
      this.name,
      @JsonKey(name: 'landing_date') this.landingDate,
      @JsonKey(name: 'launch_date') this.launchDate,
      this.status});

  factory _$_Rover.fromJson(Map<String, dynamic> json) =>
      _$$_RoverFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  @JsonKey(name: 'landing_date')
  final DateTime? landingDate;
  @override
  @JsonKey(name: 'launch_date')
  final DateTime? launchDate;
  @override
  final String? status;

  @override
  String toString() {
    return 'Rover(id: $id, name: $name, landingDate: $landingDate, launchDate: $launchDate, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Rover &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.landingDate, landingDate) ||
                other.landingDate == landingDate) &&
            (identical(other.launchDate, launchDate) ||
                other.launchDate == launchDate) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, landingDate, launchDate, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RoverCopyWith<_$_Rover> get copyWith =>
      __$$_RoverCopyWithImpl<_$_Rover>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RoverToJson(
      this,
    );
  }
}

abstract class _Rover implements Rover {
  const factory _Rover(
      {final int? id,
      final String? name,
      @JsonKey(name: 'landing_date') final DateTime? landingDate,
      @JsonKey(name: 'launch_date') final DateTime? launchDate,
      final String? status}) = _$_Rover;

  factory _Rover.fromJson(Map<String, dynamic> json) = _$_Rover.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  @JsonKey(name: 'landing_date')
  DateTime? get landingDate;
  @override
  @JsonKey(name: 'launch_date')
  DateTime? get launchDate;
  @override
  String? get status;
  @override
  @JsonKey(ignore: true)
  _$$_RoverCopyWith<_$_Rover> get copyWith =>
      throw _privateConstructorUsedError;
}
