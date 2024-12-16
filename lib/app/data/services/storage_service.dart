import 'package:result_dart/result_dart.dart';

abstract class StorageService {
  AsyncResult<String> get(String key);

  AsyncResult<Unit> put(String key, dynamic value);

  AsyncResult<bool> containsKey(String key);

  AsyncResult<Unit> clear();

  AsyncResult<Unit> remove(String key);
}
