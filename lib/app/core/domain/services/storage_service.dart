import 'package:dartz/dartz.dart';
import '../errors/storege_errors.dart';

abstract class StorageService {
  Future<Either<StorageFailure, String>> get(String key);
  Future<Either<StorageFailure, Unit>> put(String key, dynamic value);
  Future<Either<StorageFailure, bool>> containsKey(String key);
  Future<Either<StorageFailure, Unit>> clear();
  Future<Either<StorageFailure, Unit>> remove(String key);
}
