import 'package:creative_fabrica_assignment/data/datasources/remote_data_source.dart';
import 'package:creative_fabrica_assignment/data/helpers/rest_client.dart';
import 'package:creative_fabrica_assignment/domain/repositories/mars_photos_repository.dart';
import 'package:creative_fabrica_assignment/domain/usecases/get_mars_photos.dart';
import 'package:dio/dio.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  MarsPhotosRepository,
  GetMarsPhotos,
  RemoteDataSource,
  RestClient,
], customMocks: [
  MockSpec<Dio>(as: #MockDioClient),
])
void main() {}
