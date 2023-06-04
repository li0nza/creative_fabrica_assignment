import 'dart:convert';
import 'dart:io';

import 'package:creative_fabrica_assignment/data/datasources/remote_data_source.dart';
import 'package:creative_fabrica_assignment/data/helpers/exceptions.dart';
import 'package:creative_fabrica_assignment/domain/entities/mars_photos.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockRestClient mockRestClient;
  late RemoteDataSourceImpl dataSource;
  Map<String, String> urlParams = {'page': '0', 'sol': '1000'};

  setUp(() {
    mockRestClient = MockRestClient();
    dataSource = RemoteDataSourceImpl(client: mockRestClient);
  });

  group('Remote data source tests', () {
    final String dummyString = File('test/data/dummy_data/photo_data.json').readAsStringSync();
    final tMarsPhotos = MarsPhotos.fromJson(
      jsonDecode(dummyString),
    );

    test(
      'Should return a response that parses into a MarsPhotos model when the response code is 200',
      () async {
        // arrange
        when(
          mockRestClient.get(endpoint: '', urlParams: urlParams),
        ).thenAnswer(
          (_) async => Response(data: jsonDecode(dummyString), statusCode: 200, requestOptions: RequestOptions()),
        );

        // act
        final result = await dataSource.get(endpoint: '', urlParams: urlParams);

        // assert
        expect(MarsPhotos.fromJson(jsonDecode(result)), equals(tMarsPhotos));
      },
    );

    test(
      'Should return a response that parses into a Property model when the response code is 200',
      () async {
        // arrange
        when(
          mockRestClient.get(endpoint: 'be375522-ffab-4110-9e4e-51ec12195a1a', urlParams: null),
        ).thenAnswer(
          (_) async => Response(data: jsonDecode(dummyString), statusCode: 200, requestOptions: RequestOptions()),
        );

        // act
        final result = await dataSource.get(endpoint: 'be375522-ffab-4110-9e4e-51ec12195a1a', urlParams: null);

        // assert
        expect(MarsPhotos.fromJson(jsonDecode(result)), equals(tMarsPhotos));
      },
    );

    test(
      'Should throw a [BadRequestException] when the response code is 400',
      () async {
        // arrange
        when(
          mockRestClient.get(endpoint: '', urlParams: urlParams),
        ).thenAnswer(
          (_) async => Response(data: 'Not found', statusCode: 400, requestOptions: RequestOptions()),
        );

        // act
        final call = dataSource.get(endpoint: '', urlParams: urlParams);

        // assert
        expect(() => call, throwsA(isA<BadRequestException>()));
      },
    );
    test(
      'Should throw an [UnauthorisedException] when the response code is 401 or 403',
      () async {
        // arrange
        when(
          mockRestClient.get(endpoint: '', urlParams: urlParams),
        ).thenAnswer(
          (_) async => Response(data: 'Not found', statusCode: 401, requestOptions: RequestOptions()),
        );

        // act
        final call = dataSource.get(endpoint: '', urlParams: urlParams);

        // assert
        expect(() => call, throwsA(isA<UnauthorisedException>()));
      },
    );
    test(
      'Should throw a [FetchDataException] when the response code is 404 or other',
      () async {
        // arrange
        when(
          mockRestClient.get(endpoint: '', urlParams: urlParams),
        ).thenAnswer(
          (_) async => Response(data: 'Not found', statusCode: 404, requestOptions: RequestOptions()),
        );

        // act
        final call = dataSource.get(endpoint: '', urlParams: urlParams);

        // assert
        expect(() => call, throwsA(isA<FetchDataException>()));
      },
    );
  });
}
