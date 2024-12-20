import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:result_command/result_command.dart';
import 'package:result_dart/result_dart.dart';

import '../../../../config/providers.dart';
import '../../../../domain/entities/settings/settings.dart';
import '../../../../domain/errors/generic_errors.dart';
import '../../../../domain/use_cases/get_settings.dart';
import '../../../../domain/view_models/data_viewmodel.dart';
import '../../../home/home_page.dart';

class SplashScreenViewModel extends ChangeNotifier {
  final GetSettings getSettings;
  final DataViewModel dataViewModel;

  Command0<Settings> getSettingsCommand = Command0<Settings>(() async => Failure(Exception("")));

  SplashScreenViewModel({
    required this.getSettings,
    required this.dataViewModel,
  }) {
    getSettingsCommand = Command0<Settings>(() async => await getSettings());
    getSettingsCommand.execute();
  }

  void listenSettings(BuildContext context) {
    getSettingsCommand.addListener(() {
      final snapshot = getSettingsCommand.value;
      if (snapshot is SuccessCommand<Settings>) {
        dataViewModel.updateSettings(snapshot.value);
        _pushHome(context);
      } else if (snapshot is FailureCommand<Settings>) {
        final error = snapshot.error;
        _errorSettings(error);
      }
    });
  }

  void _pushHome(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(
          homeViewModel: getIt(),
          modalViewModel: getIt(),
        ),
      ),
    );
  }

  void _errorSettings(Exception e) {
    Logger().e(e);
    if (e is GenericFailure) {
      AsukaSnackbar.alert(e.message).show();
    } else {
      AsukaSnackbar.alert("Erro ao recuperar configurações").show();
    }
  }
}
