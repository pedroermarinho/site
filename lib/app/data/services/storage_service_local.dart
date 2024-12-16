import 'package:result_dart/result_dart.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/errors/storege_errors.dart';
import 'storage_service.dart';

class StorageServiceLocal implements StorageService {
  @override
  Future<Result<Unit>> clear() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      prefs.clear();
      return Success(unit);
    } on Exception catch (e) {
      print(e);
      return Failure(ErrorClearStorage(message: "Error ao limpar os dados"));
    }
  }

  @override
  Future<Result<bool>> containsKey(String key) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final result = prefs.containsKey(key);

      return Success(result);
    } on Exception catch (e) {
      print(e);
      return Failure(ErrorContainsKeyStorage(message: "Error ao Procurar a chave"));
    }
  }

  @override
  Future<Result<String>> get(String key) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final result = prefs.getString(key);
      if (result != null) {
        return Success(result);
      }
      return Failure(ErrorContainsKeyStorage(message: "Error ao Procurar a chave"));
    } on Exception catch (e) {
      print(e);
      return Failure(ErrorContainsKeyStorage(message: "Error ao Procurar a chave"));
    }
  }

  @override
  Future<Result<Unit>> put(String key, dynamic value) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString(key, value);
      return Success(unit);
    } on Exception catch (e) {
      print(e);
      return Failure(ErrorPutStorage(message: "Error ao inserir os dados"));
    }
  }

  @override
  Future<Result<Unit>> remove(String key) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      prefs.remove(key);
      return Success(unit);
    } on Exception catch (e) {
      print(e);
      return Failure(ErrorRemoveStorage(message: "Error ao remover os dados da chave"));
    }
  }
}
