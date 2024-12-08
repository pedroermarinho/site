import 'package:dartz/dartz.dart';

import '../../data/repositories/theme/theme_repository.dart';
import '../entities/theme/theme_enum.dart';
import '../errors/theme_errors.dart';

abstract class GetTheme {
  Future<Either<ThemeFailure, ThemeEnum>> call();
}

class GetThemeImpl implements GetTheme {
  final ThemeRepository repository;

  GetThemeImpl(this.repository);

  @override
  Future<Either<ThemeFailure, ThemeEnum>> call() async => await repository.getTheme();
}
