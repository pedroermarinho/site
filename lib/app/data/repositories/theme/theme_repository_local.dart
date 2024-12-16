import 'package:result_dart/result_dart.dart';

import '../../../config/constants.dart';
import '../../../domain/entities/theme/theme_enum.dart';
import '../../services/storage_service.dart';
import 'theme_repository.dart';

class ThemeRepositoryLocal implements ThemeRepository {
  final StorageService service;

  ThemeRepositoryLocal(this.service);

  @override
  Future<Result<ThemeEnum>> getTheme() async => (await service.get(Constants.keyTheme)).fold(
        (theme) {
          if (theme == ThemeEnum.darkTheme.toString()) {
            return Success(ThemeEnum.darkTheme);
          } else {
            return Success(ThemeEnum.lightTheme);
          }
        },
        Failure.new,
      );

  @override
  Future<Result<Unit>> setTheme(ThemeEnum themeEnum) async => (await service.put(Constants.keyTheme, themeEnum.toString())).fold(
        Success.new,
        Failure.new,
      );
}
