import 'package:dartz/dartz.dart';

import '../../../config/constants.dart';
import '../../../domain/entities/theme/theme_enum.dart';
import '../../../domain/errors/theme_errors.dart';
import '../../services/storage_service.dart';
import 'theme_repository.dart';

class ThemeRepositoryLocal implements ThemeRepository {
  final StorageService service;

  ThemeRepositoryLocal(this.service);

  @override
  Future<Either<ThemeFailure, ThemeEnum>> getTheme() async => (await service.get(Constants.keyTheme)).fold(
        (l) => Left(ErrorGetTheme(message: l.message)),
        (theme) {
          if (theme == ThemeEnum.darkTheme.toString()) {
            return Right(ThemeEnum.darkTheme);
          } else {
            return Right(ThemeEnum.lightTheme);
          }
        },
      );

  @override
  Future<Either<ThemeFailure, Unit>> setTheme(ThemeEnum themeEnum) async =>
      (await service.put(Constants.keyTheme, themeEnum.toString())).fold((l) => Left(ErrorSetTheme(message: l.message)), Right.new);
}
