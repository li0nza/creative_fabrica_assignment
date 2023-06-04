import 'package:creative_fabrica_assignment/data/helpers/failure.dart';
import 'package:creative_fabrica_assignment/domain/entities/mars_photos.dart';
import 'package:dartz/dartz.dart';

/// Repository providing an interface for a data-layer implementation
/// for fetching a [MarsPhotos].
abstract class MarsPhotosRepository {
  Future<Either<Failure, MarsPhotos>> getMarsPhotos({required int page, required int sol});
}
