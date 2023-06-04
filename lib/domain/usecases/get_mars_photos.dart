import 'package:creative_fabrica_assignment/data/helpers/failure.dart';
import 'package:creative_fabrica_assignment/domain/entities/mars_photos.dart';
import 'package:creative_fabrica_assignment/domain/repositories/mars_photos_repository.dart';
import 'package:dartz/dartz.dart';

/// Usecase that interacts with the [MarsPhotosRepository], used to fetch a [MarsPhotos]
class GetMarsPhotos {
  final MarsPhotosRepository repository;

  GetMarsPhotos(this.repository);

  Future<Either<Failure, MarsPhotos>> execute({int page = 0, int sol = 1000}) {
    return repository.getMarsPhotos(page: page, sol: sol);
  }
}
