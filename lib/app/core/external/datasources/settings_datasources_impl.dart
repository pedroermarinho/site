import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';

import '../../domain/entities/settings/settings.dart';
import '../../domain/errors/settings_errors.dart';
import '../../infra/datasources/settings_datasources.dart';

class SettingsDataSourceImpl implements SettingsDataSource {
  @override
  Future<Either<SettingsFailure, Settings>> getSettings() async {
    try {
      final response = await rootBundle.loadString('assets/settings.json');
      final data = await json.decode(response);
      final settings = Settings.fromJson(data);
      return Right(settings);
    } on Exception catch (e) {
      return Left(
          ErrorGetSettings(message: "Erro ao carregar as configurações"));
    }
  }
}
