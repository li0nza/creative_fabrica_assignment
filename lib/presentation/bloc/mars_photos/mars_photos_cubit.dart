import 'dart:ffi';

import 'package:creative_fabrica_assignment/domain/entities/mars_photos.dart';
import 'package:creative_fabrica_assignment/domain/usecases/get_mars_photos.dart';
import 'package:creative_fabrica_assignment/presentation/bloc/mars_photos/mars_photos_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// [Cubit] managing the [MarsPhotosState]]. Requires the [getMarsPhotos] `use case`
class MarsPhotosCubit extends Cubit<MarsPhotosState> {
  final GetMarsPhotos _getMarsPhotos;
  int _sol = 1000;
  int _page = 0;
  List<Photo> _photos = [];

  MarsPhotosCubit(this._getMarsPhotos) : super(const MarsPhotosState.loading());

  /// Method to fetch a [MarsPhotos] with a list of [Photo]s.
  /// On success will emit `MarsPhotosState.hasData` and a list of the [Photo]s.
  /// On Failure will emit `MarsPhotosState.error`.
  /// On no photos will emit `MarsPhotosState.empty`.
  void fetchMarsPhotos() async {
    final result = await _getMarsPhotos.execute(page: _page, sol: _sol);
    result.fold(
      (failure) {
        // TODO: improve usage of `hasError` by exposing the type of error
        emit(MarsPhotosState.error(error: failure.message));
      },
      (data) {
        _page += 1;
        _photos.addAll(data.photos);
        if (_photos.isEmpty) {
          emit(const MarsPhotosState.empty());
        } else {
          emit(MarsPhotosState.hasData(photos: _photos, page: _page));
        }
      },
    );
  }

  /// Method to fetch a [MarsPhotos] with a list of [Photo]s.
  Future<void> filterOnSol(String sol) async {
    emit(const MarsPhotosState.loading());
    _photos = [];
    if (sol.isEmpty) sol = '1000';
    _sol = int.parse(sol);
    _page = 0;
    fetchMarsPhotos();
  }

  /// Method to [reset] and fetch a [MarsPhotos] with a list of [Photo]s.
  Future<void> reset() async {
    emit(const MarsPhotosState.loading());
    _photos = [];
    _sol = 1000;
    _page = 0;
    fetchMarsPhotos();
  }
}
