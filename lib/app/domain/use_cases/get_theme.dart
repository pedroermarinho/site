import 'package:result_dart/result_dart.dart';

import '../../data/repositories/theme/theme_repository.dart';
import '../entities/theme/theme_enum.dart';

abstract class GetTheme {
  AsyncResult<ThemeEnum> call();
}

class GetThemeImpl implements GetTheme {
  final ThemeRepository repository;

  GetThemeImpl(this.repository);

  @override
  AsyncResult<ThemeEnum> call() async => await repository.getTheme();
}
