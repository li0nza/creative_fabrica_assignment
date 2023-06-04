import 'dart:convert';

import 'package:creative_fabrica_assignment/data/helpers/exceptions.dart';
import 'package:creative_fabrica_assignment/data/helpers/rest_client.dart';

abstract class RemoteDataSource {
  Future<String> get({Map<String, String>? urlParams, required String endpoint});
}

class RemoteDataSourceImpl implements RemoteDataSource {
  /// Needs a [RestClient] instance to execute the HTTP requests with.
  final RestClient client;

  RemoteDataSourceImpl({required this.client});

  /// Basic [get] used to fetch data from APIs.
  ///
  /// Requires an [endpoint] and optional [urlParams]
  ///
  /// Returns a [String], or handles the error if one occurs, throwing either a
  /// [BadRequestException], [UnauthorisedException] or [FetchDataException]
  @override
  Future<String> get({Map<String, String>? urlParams, required String endpoint}) async {
    final response = await client.get(endpoint: endpoint, urlParams: urlParams);
    switch (response.statusCode) {
      case 200:
        return jsonEncode(response.data);
      case 400:
        throw BadRequestException(jsonEncode(response.data));
      case 401:
      case 403:
        throw UnauthorisedException(jsonEncode(response.data));
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
