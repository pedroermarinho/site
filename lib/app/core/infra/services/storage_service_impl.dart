import 'package:dartz/dartz.dart';

import '../../domain/errors/storege_errors.dart';
import '../../domain/services/storage_service.dart';
import '../drivers/storage_driver.dart';

class StorageServiceImpl implements StorageService {
  final StorageDriver driver;

  StorageServiceImpl(this.driver);

  @override
  Future<Either<StorageFailure, Unit>> clear() async => await driver.clear();

  @override
  Future<Either<StorageFailure, bool>> containsKey(String key) async =>
      await driver.containsKey(key);

  @override
  Future<Either<StorageFailure, String>> get(String key) async =>
      await driver.get(key);

  @override
  Future<Either<StorageFailure, Unit>> put(String key, dynamic value) async =>
      await driver.put(key, value);

  @override
  Future<Either<StorageFailure, Unit>> remove(String key) async =>
      await driver.remove(key);
}
