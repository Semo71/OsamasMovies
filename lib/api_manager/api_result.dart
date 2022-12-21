import 'network_error.dart';

// class APIResult<T extends JsonSerializable> {
class APIResult<T> {
  T? _object;
  NetworkError? _error;

  APIResult();

  APIResult.object(T? object) {
    _object = object;
    _error = null;
  }
  APIResult.error(NetworkError error) {
    _error = error;
    _object = null;
  }


  T? get object => _object;
  NetworkError? get error => _error;
  bool isLoading() => _object == null && _error == null;
}
