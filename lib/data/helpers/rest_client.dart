import 'dart:io';

import 'package:creative_fabrica_assignment/data/helpers/exceptions.dart';
import 'package:creative_fabrica_assignment/data/helpers/firebase_remote_config_service.dart';
import 'package:dio/dio.dart';

/// [RestClient] used to implement API calls, requires a `Dio` instance.
class RestClient {
  final Dio client;
  RestClient({required this.client});

  /// [get] uses a `Dio` client to do a HTTP `get` to the `_baseUrl + endpoint`, also
  /// accepts an optional `Map<String, String>` for `urlParams`.
  ///
  /// [Response] is returned, or [SocketException] if no connectivity is available.
  Future<Response> get({required String endpoint, Map<String, String>? urlParams}) async {
    try {
      String queryString = '';
      String baseUrl = FirebaseRemoteConfigService().getString('base_url');
      Map<String, String> apiKeyMap = {'api_key': FirebaseRemoteConfigService().getString('api_key')};
      Uri uri;
      if (urlParams == null) {
        urlParams = apiKeyMap;
      } else {
        urlParams.addAll(apiKeyMap);
      }
      urlParams.forEach((key, value) {
        queryString += "&$key=$value";
      });

      uri = Uri.parse('$baseUrl$endpoint?$queryString');

      final response = await client.get(uri.toString()).timeout(const Duration(seconds: 5));
      return response;
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } on Exception {
      throw FetchDataException();
    }
  }
}
