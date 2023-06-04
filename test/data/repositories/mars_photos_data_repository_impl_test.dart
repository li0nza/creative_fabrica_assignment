import 'dart:io';

import 'package:creative_fabrica_assignment/data/helpers/exceptions.dart';
import 'package:creative_fabrica_assignment/data/helpers/failure.dart';
import 'package:creative_fabrica_assignment/data/repositories/mars_photos_repository_impl.dart';
import 'package:creative_fabrica_assignment/domain/entities/mars_photos.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';
import '../helpers/test_mars_photos_data_model.dart';

void main() {
  late MockRemoteDataSource mockRemoteDataSource;
  late MarsPhotosRepositoryImpl repository;
  Map<String, String> urlParams = {'page': '0', 'sol': '1000'};

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    repository = MarsPhotosRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
    );
  });

  MarsPhotos tMarsPhotos = TestMarsPhotosModel.tMarsPhotos;

  final File dummyJsonFile = File('test/data/dummy_data/photo.json');

  group('Get MarsPhotos', () {
    test(
      'Should return a String that parses into a MarsPhotos when the call to the data source is successful',
      () async {
        // arrange
        when(mockRemoteDataSource.get(endpoint: 'rovers/curiosity/photos', urlParams: urlParams))
            .thenAnswer((_) async => dummyJsonFile.readAsStringSync());

        // act
        final result = await repository.getMarsPhotos(page: 0, sol: 1000);

        // assert
        verify(mockRemoteDataSource.get(endpoint: 'rovers/curiosity/photos', urlParams: urlParams));
        expect(result, equals(Right(tMarsPhotos)));
      },
    );

    test(
      'Should return a FetchDataException when the call to the data source is unsuccessful',
      () async {
        // arrange
        when(mockRemoteDataSource.get(endpoint: 'rovers/curiosity/photos', urlParams: urlParams)).thenThrow(FetchDataException());

        // act
        final result = await repository.getMarsPhotos(page: 0, sol: 1000);

        // assert
        verify(mockRemoteDataSource.get(endpoint: 'rovers/curiosity/photos', urlParams: urlParams));
        expect(result, equals(const Left(ServerFailure(''))));
      },
    );

    test(
      'Should return a connection failure when the device has no connectivity',
      () async {
        // arrange
        when(mockRemoteDataSource.get(endpoint: 'rovers/curiosity/photos', urlParams: urlParams))
            .thenThrow(const SocketException('Failed to connect to the network'));

        // act
        final result = await repository.getMarsPhotos(page: 0, sol: 1000);

        // assert
        verify(mockRemoteDataSource.get(endpoint: 'rovers/curiosity/photos', urlParams: urlParams));
        expect(
          result,
          equals(const Left(ConnectionFailure('Failed to connect to the network'))),
        );
      },
    );
  });
}
