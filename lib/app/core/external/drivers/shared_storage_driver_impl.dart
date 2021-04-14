import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/errors/storege_errors.dart';
import '../../infra/drivers/storage_driver.dart';

class SharedStorageDriver implements StorageDriver {
  @override
  Future<Either<StorageFailure, Unit>> clear() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      prefs.clear();
      return Right(unit);
    } on Exception catch (e) {
      print(e);
      return Left(ErrorClearStorage(message: "Error ao limpar os dados"));
    }
  }

  @override
  Future<Either<StorageFailure, bool>> containsKey(String key) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final result = prefs.containsKey(key);

      return Right(result);
    } on Exception catch (e) {
      print(e);
      return Left(
          ErrorContainsKeyStorage(message: "Error ao Procurar a chave"));
    }
  }

  @override
  Future<Either<StorageFailure, String>> get(String key) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final result = prefs.getString(key);
      if (result != null) {
        return Right(result);
      }
      return Left(
          ErrorContainsKeyStorage(message: "Error ao Procurar a chave"));
    } on Exception catch (e) {
      print(e);
      return Left(
          ErrorContainsKeyStorage(message: "Error ao Procurar a chave"));
    }
  }

  @override
  Future<Either<StorageFailure, Unit>> put(String key, dynamic value) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString(key, value);
      return Right(unit);
    } on Exception catch (e) {
      print(e);
      return Left(ErrorPutStorage(message: "Error ao inserir os dados"));
    }
  }

  @override
  Future<Either<StorageFailure, Unit>> remove(String key) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      prefs.remove(key);
      return Right(unit);
    } on Exception catch (e) {
      print(e);
      return Left(
          ErrorRemoveStorage(message: "Error ao remover os dados da chave"));
    }
  }
}
