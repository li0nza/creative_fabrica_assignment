import 'dart:convert';
import 'dart:io';

import 'package:creative_fabrica_assignment/data/helpers/exceptions.dart';
import 'package:creative_fabrica_assignment/data/helpers/rest_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mocktail/mocktail.dart';

class MockDioClient extends Mock implements Dio {}

class FakeUri extends Fake implements Uri {}

void main() {
  late RestClient restClient;
  late MockDioClient mockDioClient;

  setUpAll(() {
    registerFallbackValue(FakeUri());
    mockDioClient = MockDioClient();
    restClient = RestClient(client: mockDioClient);
  });

  group('Rest client tests', () {
    final String dummyString = File('test/data/dummy_data/photo.json').readAsStringSync();

    //TODO: fix this test, it fails because of firebase and remote config, will take some time to figure it out
    //  Not in scope for an assignment
    test(
      'Should return a response with statusCode = 200 and data when a successful call with [urlParams] is made',
      () async {
        // arrange
        when(
          () => mockDioClient.get(any()),
        ).thenAnswer(
          (_) async => Response(data: jsonDecode(dummyString), statusCode: 200, requestOptions: RequestOptions()),
        );

        // act
        final result = await restClient.get(endpoint: '', urlParams: {'page': '1'});

        // assert
        expect(result.data.isNotEmpty && result.statusCode == 200, true);
      },
    );

    test(
      'Should return a [SocketException] if no connectivity is available',
      () async {
        // arrange
        when(
          () => mockDioClient.get(any()),
        ).thenThrow(const SocketException('Socket Exception'));

        // act
        try {
          final result = await restClient.get(endpoint: '', urlParams: {'page': '1'});
          return result;
        } catch (error) {
          expect(error, isA<FetchDataException>());
        }
      },
    );
    test(
      'Should return a [Exception] if a timeout occurs',
      () async {
        // arrange
        when(
          () => mockDioClient.get(any()),
        ).thenThrow(Exception('Timeout'));

        // act
        try {
          final result = await restClient.get(endpoint: '', urlParams: {'page': '1'});
          return result;
        } catch (error) {
          expect(error, isA<FetchDataException>());
        }
      },
    );
  });
}
