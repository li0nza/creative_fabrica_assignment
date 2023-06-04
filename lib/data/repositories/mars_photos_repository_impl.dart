import 'dart:convert';
import 'dart:io';

import 'package:creative_fabrica_assignment/domain/repositories/mars_photos_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:creative_fabrica_assignment/data/datasources/remote_data_source.dart';
import 'package:creative_fabrica_assignment/data/helpers/exceptions.dart';
import 'package:creative_fabrica_assignment/data/helpers/failure.dart';
import 'package:creative_fabrica_assignment/domain/entities/mars_photos.dart';

/// Implements [MarsPhotosRepository], requires a [RemoteDataSource]
class MarsPhotosRepositoryImpl implements MarsPhotosRepository {
  final RemoteDataSource remoteDataSource;

  MarsPhotosRepositoryImpl({required this.remoteDataSource});

  /// [getMarsPhotos] takes a `page` paramater and makes a call to the `RemoteDataSource`
  /// Returns a [MarsPhotos] model
  @override
  Future<Either<Failure, MarsPhotos>> getMarsPhotos({required int page, required int sol}) async {
    try {
      final result = await remoteDataSource
          .get(endpoint: 'rovers/curiosity/photos', urlParams: {'page': page.toString(), 'sol': sol.toString()});

      final MarsPhotos data = MarsPhotos.fromJson(jsonDecode(result));
      print(data);
      return Right(data);
    } on FetchDataException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    } catch (error, stacktrace) {
      print('Exception occured: $error stackTrace: $stacktrace');
      return Left(DataFetchFailure(error.toString()));
    }
  }
}
