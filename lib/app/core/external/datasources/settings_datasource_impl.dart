import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';

import '../../domain/entities/settings/settings.dart';
import '../../domain/errors/settings_errors.dart';
import '../../infra/datasources/settings_datasource.dart';

class SettingsDataSourceImpl implements SettingsDataSource {
  final Dio dio;

  SettingsDataSourceImpl({required this.dio});

  @override
  Future<Either<SettingsFailure, Settings>> getSettings() async {
    try {
      final response = await dio.get('https://raw.githubusercontent.com/pedroermarinho/site/master/assets/settings.json');
      final data = await json.decode(response.data);
      final settings = Settings.fromJson(data);
      return Right(settings);
    }on DioError catch(e) {
      Logger().e(e);
      return Left(ErrorGetSettings(message: e.message??"Erro ao buscar configurações"));
    } on Exception catch (_) {
      return Left(
          ErrorGetSettings(message: "Erro ao carregar as configurações"));
    }
  }
}
