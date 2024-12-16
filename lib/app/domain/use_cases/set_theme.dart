import 'package:result_dart/result_dart.dart';

import '../../data/repositories/theme/theme_repository.dart';
import '../entities/theme/theme_enum.dart';

abstract class SetTheme {
  Future<Result<Unit>> call(ThemeEnum themeEnum);
}

class SetThemeImpl implements SetTheme {
  final ThemeRepository repository;

  SetThemeImpl(this.repository);

  @override
  Future<Result<Unit>> call(ThemeEnum themeEnum) async => await repository.setTheme(themeEnum);
}
