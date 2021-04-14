import 'package:dartz/dartz.dart';

import '../../domain/entities/theme/theme_enum.dart';
import '../../domain/errors/theme_errors.dart';
import '../../domain/services/storage_service.dart';
import '../../infra/datasources/theme_datasource.dart';
import '../../presenter/utils/constants.dart';

class ThemeDataSourceImpl implements ThemeDataSource {
  final StorageService service;

  ThemeDataSourceImpl(this.service);

  @override
  Future<Either<ThemeFailure, ThemeEnum>> getTheme() async =>
      (await service.get(Constants.keyTheme)).fold(
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
      (await service.put(Constants.keyTheme, themeEnum.toString())).fold(
          (l) => Left(ErrorSetTheme(message: l.message)), (r) => Right(r));
}
