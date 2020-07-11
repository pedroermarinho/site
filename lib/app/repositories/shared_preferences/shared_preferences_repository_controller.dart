import 'package:mobx/mobx.dart';
import 'package:site/app/repositories/shared_preferences/repository/shared_preferences_repository.dart';

part 'shared_preferences_repository_controller.g.dart';

class SharedPreferencesRepositoryController = _SharedPreferencesRepositoryControllerBase
    with _$SharedPreferencesRepositoryController;

abstract class _SharedPreferencesRepositoryControllerBase with Store {
  final _preferencesRepository = SharedPreferencesRepository();

  void saveTheme(String theme) {
    _preferencesRepository.saveTheme(theme);
  }

  Future<String> getTheme() {
    return _preferencesRepository.getTheme();
  }
}
