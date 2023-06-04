import 'package:creative_fabrica_assignment/data/datasources/remote_data_source.dart';
import 'package:creative_fabrica_assignment/data/helpers/rest_client.dart';
import 'package:creative_fabrica_assignment/data/repositories/mars_photos_repository_impl.dart';
import 'package:creative_fabrica_assignment/domain/repositories/mars_photos_repository.dart';
import 'package:creative_fabrica_assignment/domain/usecases/get_mars_photos.dart';
import 'package:creative_fabrica_assignment/presentation/bloc/login/login_cubit.dart';
import 'package:creative_fabrica_assignment/presentation/bloc/mars_photos/mars_photos_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void init() {
  // cubits
  locator.registerFactory(() => MarsPhotosCubit(locator()));
  locator.registerFactory(() => LoginCubit());

  // use cases
  locator.registerLazySingleton(() => GetMarsPhotos(locator()));

  // repositories
  locator.registerLazySingleton<MarsPhotosRepository>(
    () => MarsPhotosRepositoryImpl(
      remoteDataSource: locator(),
    ),
  );

  // data sources
  locator.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(
      client: locator(),
    ),
  );

  // external
  locator.registerLazySingleton(() => RestClient(client: Dio()));
}