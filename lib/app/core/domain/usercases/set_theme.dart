import 'package:dartz/dartz.dart';
import '../entities/theme/theme_enum.dart';
import '../errors/theme_errors.dart';
import '../repositories/theme_repository.dart';

abstract class SetTheme {
  Future<Either<ThemeFailure, Unit>> call(ThemeEnum themeEnum);
}

class SetThemeImpl implements SetTheme {
  final ThemeRepository repository;

  SetThemeImpl(this.repository);

  @override
  Future<Either<ThemeFailure, Unit>> call(ThemeEnum themeEnum) async =>
      await repository.setTheme(themeEnum);
}
