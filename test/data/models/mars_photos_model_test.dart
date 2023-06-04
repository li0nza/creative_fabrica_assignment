import 'dart:convert';
import 'dart:io';

import 'package:creative_fabrica_assignment/domain/entities/mars_photos.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/test_mars_photos_data_model.dart';

Future<void> main() async {
  MarsPhotos tMarsPhotos = TestMarsPhotosModel.tMarsPhotos;

  group('From json', () {
    test(
      'Should return a valid model from json',
      () async {
        final File dummyJsonFile = File('test/data/dummy_data/photo.json');
        final Map<String, dynamic> jsonMap = jsonDecode(dummyJsonFile.readAsStringSync());

        final result = MarsPhotos.fromJson(jsonMap);

        expect(result, equals(tMarsPhotos));
      },
    );
  });
}
