class AppException implements Exception {
  final String _message;
  final String _prefix;

  AppException([this._message = '', this._prefix = '']);

  @override
  String toString() => '$_prefix$_message';
}
/// [FetchDataException] accepts a `message` to be thrown
class FetchDataException extends AppException {
  FetchDataException([String message = 'Unknown FetchDataException']) : super(message, "Error During Communication: ");
}
/// [BadRequestException] accepts a `message` to be thrown
class BadRequestException extends AppException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}
/// [UnauthorisedException] accepts a `message` to be thrown
class UnauthorisedException extends AppException {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}