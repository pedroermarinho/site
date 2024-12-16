import 'package:result_dart/result_dart.dart';

import '../../data/repositories/theme/theme_repository.dart';
import '../entities/theme/theme_enum.dart';

abstract class GetTheme {
  Future<Result<ThemeEnum>> call();
}

class GetThemeImpl implements GetTheme {
  final ThemeRepository repository;

  GetThemeImpl(this.repository);

  @override
  Future<Result<ThemeEnum>> call() async => await repository.getTheme();
}
