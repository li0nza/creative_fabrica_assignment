import 'package:creative_fabrica_assignment/domain/entities/mars_photos.dart';
import 'package:creative_fabrica_assignment/domain/usecases/get_mars_photos.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../data/helpers/test_mars_photos_data_model.dart';
import '../../helpers/test_helper.mocks.dart';

Future<void> main() async {
  late MockMarsPhotosRepository mockMarsPhotosRepository;
  late GetMarsPhotos usecase;

  setUp(() {
    mockMarsPhotosRepository = MockMarsPhotosRepository();
    usecase = GetMarsPhotos(mockMarsPhotosRepository);
  });

  MarsPhotos tMarsPhotos = TestMarsPhotosModel.tMarsPhotos;

  test(
    'Get MarsPhotos from repository',
    () async {
      // arrange
      when(mockMarsPhotosRepository.getMarsPhotos(page: 0, sol: 1000)).thenAnswer((_) async => Right(tMarsPhotos));

      // act
      final result = await usecase.execute();

      // assert
      expect(result, equals(Right(tMarsPhotos)));
    },
  );
}
