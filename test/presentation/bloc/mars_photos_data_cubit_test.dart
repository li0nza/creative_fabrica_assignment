import 'package:creative_fabrica_assignment/data/helpers/failure.dart';
import 'package:creative_fabrica_assignment/domain/entities/mars_photos.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:creative_fabrica_assignment/presentation/bloc/mars_photos/mars_photos_cubit.dart';
import 'package:creative_fabrica_assignment/presentation/bloc/mars_photos/mars_photos_state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../data/helpers/test_mars_photos_data_model.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockGetMarsPhotos mockgetMarsPhotos;

  setUp(() {
    mockgetMarsPhotos = MockGetMarsPhotos();
  });

  MarsPhotos tMarsPhotos = TestMarsPhotosModel.tMarsPhotos;

  blocTest<MarsPhotosCubit, MarsPhotosState>(
    'Should return "MarsPhotosState.hasData" when data has been fetched successfully',
    build: () => MarsPhotosCubit(mockgetMarsPhotos),
    act: (cubit) {
      when(mockgetMarsPhotos.execute(page: 0, sol: 1000)).thenAnswer((_) async => Right(tMarsPhotos));
      cubit.fetchMarsPhotos();
    },
    wait: const Duration(milliseconds: 300),
    expect: () => [
      MarsPhotosState.hasData(photos: tMarsPhotos.photos, page: 1),
    ],
    verify: (bloc) {
      verify(mockgetMarsPhotos.execute(page: 0, sol: 1000));
    },
  );

  blocTest<MarsPhotosCubit, MarsPhotosState>(
    'Should return "MarsPhotosState.hasData" when data has been fetched successfully after searching',
    build: () => MarsPhotosCubit(mockgetMarsPhotos),
    act: (cubit) {
      when(mockgetMarsPhotos.execute(page: 0, sol: 1000)).thenAnswer((_) async => Right(tMarsPhotos));
      cubit.filterOnSol('1000');
    },
    wait: const Duration(milliseconds: 100),
    expect: () => [
      const MarsPhotosState.loading(),
      MarsPhotosState.hasData(photos: tMarsPhotos.photos, page: 1),
    ],
    verify: (bloc) {
      verify(mockgetMarsPhotos.execute(page: 0, sol: 1000));
    },
  );

  blocTest<MarsPhotosCubit, MarsPhotosState>(
    'Should return "MarsPhotosState.error" when fetching data fails',
    build: () => MarsPhotosCubit(mockgetMarsPhotos),
    act: (cubit) {
      when(mockgetMarsPhotos.execute(page: 0, sol: 1000)).thenAnswer((_) async => const Left(ServerFailure('')));
      cubit.fetchMarsPhotos();
    },
    expect: () => [
      const MarsPhotosState.error(error: ''),
    ],
    verify: (bloc) {
      verify(mockgetMarsPhotos.execute(page: 0, sol: 1000));
    },
  );
}
