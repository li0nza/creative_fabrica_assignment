import 'dart:convert';
import 'dart:io';

import 'package:creative_fabrica_assignment/domain/entities/mars_photos.dart';
import 'package:creative_fabrica_assignment/presentation/bloc/mars_photos/mars_photos_cubit.dart';
import 'package:creative_fabrica_assignment/presentation/bloc/mars_photos/mars_photos_state.dart';
import 'package:creative_fabrica_assignment/presentation/pages/mars_photos_page.dart';
import 'package:creative_fabrica_assignment/presentation/widgets/loading.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:creative_fabrica_assignment/presentation/widgets/photo_overview.dart';
import 'package:get_it/get_it.dart';

import 'package:mocktail/mocktail.dart';

class MockMarsPhotosCubit extends MockCubit<MarsPhotosState> implements MarsPhotosCubit {}

class FakeMarsPhotosState extends Fake implements MarsPhotosState {}

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class FakeRoute extends Fake implements Route {}

void main() {
  late MockMarsPhotosCubit mockMarsPhotosCubit;
  late MarsPhotos tMarsPhotos;

  setUpAll(() async {
    HttpOverrides.global = null;
    registerFallbackValue(FakeMarsPhotosState());
    registerFallbackValue(FakeRoute());

    final di = GetIt.instance;
    di.registerFactory(() => mockMarsPhotosCubit);
  });

  setUp(() {
    mockMarsPhotosCubit = MockMarsPhotosCubit();
    final File dummyJsonFile = File('test/data/dummy_data/photo.json');
    final Map<String, dynamic> jsonMap = jsonDecode(dummyJsonFile.readAsStringSync());

    tMarsPhotos = MarsPhotos.fromJson(jsonMap);
  });

  Widget makeTestableWidget(Widget body) {
    return BlocProvider<MarsPhotosCubit>.value(
      value: mockMarsPhotosCubit,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets(
    'Text field should trigger state to change from empty to loading',
    (WidgetTester tester) async {
      // arrange
      when(() => mockMarsPhotosCubit.state).thenReturn(const MarsPhotosState.loading());

      // act
      await tester.pumpWidget(makeTestableWidget(const MarsPhotosPage()));
      await tester.enterText(find.byType(TextField), '1000');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();

      // assert
      verify(() => mockMarsPhotosCubit.filterOnSol('1000')).called(1);
      expect(find.byType(TextField), equals(findsOneWidget));
    },
  );

  testWidgets(
    'Should show [Loading] widget when state is loading',
    (WidgetTester tester) async {
      // arrange
      when(() => mockMarsPhotosCubit.state).thenReturn(const MarsPhotosState.loading());

      // act
      await tester.pumpWidget(makeTestableWidget(const MarsPhotosPage()));

      // assert
      expect(find.byType(Loading), equals(findsOneWidget));
    },
  );

  testWidgets(
    'Should show [ListView] with entire page when state has data',
    (WidgetTester tester) async {
      // arrange
      when(() => mockMarsPhotosCubit.state)
          .thenReturn(MarsPhotosState.hasData(photos: tMarsPhotos.photos, page: 0));

      // act
      await tester.pumpWidget(makeTestableWidget(const MarsPhotosPage()));

      // assert
      expect(find.byKey(const Key('photo_listview')), equals(findsOneWidget));
    },
  );

  testWidgets(
    'Should show a list tile for each artwork when state has data',
    (WidgetTester tester) async {
      // arrange
      when(() => mockMarsPhotosCubit.state)
          .thenReturn(MarsPhotosState.hasData(photos: tMarsPhotos.photos, page: 0));

      // act
      await tester.pumpWidget(makeTestableWidget(const MarsPhotosPage()));

      // assert
      expect(find.byType(PropertyOverview), equals(findsAtLeastNWidgets(1)));
    },
  );

  testWidgets(
    'Should show try again widget when state is not loading, does have an error, but has no data',
    (WidgetTester tester) async {
      // arrange
      when(() => mockMarsPhotosCubit.state).thenReturn(const MarsPhotosState.error(error: ''));

      // act
      await tester.pumpWidget(makeTestableWidget(const MarsPhotosPage()));

      // assert
      expect(find.byKey(const Key('photos_error_widget')), equals(findsOneWidget));
    },
  );

  testWidgets(
    'Should show [Error] widget when the state has an error',
    (WidgetTester tester) async {
      // arrange
      when(() => mockMarsPhotosCubit.state).thenReturn(const MarsPhotosState.error(error: ''));

      // act
      await tester.pumpWidget(makeTestableWidget(const MarsPhotosPage()));

      // assert
      expect(find.byKey(const Key('photos_error_widget')), equals(findsOneWidget));
    },
  );
}
