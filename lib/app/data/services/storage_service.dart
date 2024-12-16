import 'package:result_dart/result_dart.dart';

abstract class StorageService {
  Future<Result<String>> get(String key);

  Future<Result<Unit>> put(String key, dynamic value);

  Future<Result<bool>> containsKey(String key);

  Future<Result<Unit>> clear();

  Future<Result<Unit>> remove(String key);
}
