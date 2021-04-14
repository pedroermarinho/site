import 'package:dartz/dartz.dart';

import '../../domain/entities/theme/theme_enum.dart';
import '../../domain/errors/theme_errors.dart';
import '../../domain/repositories/theme_repository.dart';
import '../datasources/theme_datasource.dart';

class ThemeRepositoryImpl implements ThemeRepository {
  final ThemeDataSource dataSource;

  ThemeRepositoryImpl(this.dataSource);

  @override
  Future<Either<ThemeFailure, ThemeEnum>> getTheme() async =>
      await dataSource.getTheme();

  @override
  Future<Either<ThemeFailure, Unit>> setTheme(ThemeEnum themeEnum) async =>
      await dataSource.setTheme(themeEnum);
}
