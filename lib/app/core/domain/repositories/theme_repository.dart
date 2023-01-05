import 'package:dartz/dartz.dart';

import '../entities/theme/theme_enum.dart';
import '../errors/theme_errors.dart';

abstract class ThemeRepository {
  Future<Either<ThemeFailure, ThemeEnum>> getTheme();

  Future<Either<ThemeFailure, Unit>> setTheme(ThemeEnum themeEnum);
}
