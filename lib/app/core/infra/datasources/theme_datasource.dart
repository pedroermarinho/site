import 'package:dartz/dartz.dart';

import '../../domain/entities/theme/theme_enum.dart';
import '../../domain/errors/theme_errors.dart';

abstract class ThemeDataSource {
  Future<Either<ThemeFailure, ThemeEnum>> getTheme();

  Future<Either<ThemeFailure, Unit>> setTheme(ThemeEnum themeEnum);
}
