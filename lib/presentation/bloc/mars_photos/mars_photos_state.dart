
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:creative_fabrica_assignment/domain/entities/mars_photos.dart';

part 'mars_photos_state.freezed.dart';

/// State representing the current state of the [MarsPhotosCubit].
@freezed
class MarsPhotosState with _$MarsPhotosState {
  const factory MarsPhotosState.loading() = _LoadingState;
  const factory MarsPhotosState.empty() = _EmptyState;
  const factory MarsPhotosState.hasData({required List<Photo> photos, required int page}) = _HasDataState;
  const factory MarsPhotosState.error({required String error}) = _ErrorState;
}
