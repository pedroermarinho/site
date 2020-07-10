import 'package:shared_preferences/shared_preferences.dart';
import 'package:site/app/repositories/shared_preferences/repository/shared_preferences_repository_interface.dart';
import 'package:site/app/shared/config/constants.dart';

class SharedPreferencesRepository extends ISharedPreferencesRepository {
  @override
  Future<String> getTheme() async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.get(Constants.theme);
  }

  @override
  void saveTheme(String theme) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(Constants.theme, theme);
  }
}
