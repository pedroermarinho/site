import 'package:result_dart/result_dart.dart';

import '../../../domain/entities/theme/theme_enum.dart';

abstract class ThemeRepository {
  AsyncResult<ThemeEnum> getTheme();

  AsyncResult<Unit> setTheme(ThemeEnum themeEnum);
}
