import 'package:asuka/asuka.dart';
import 'package:flutter/foundation.dart';

import '../../../domain/entities/settings/settings.dart';
import '../../../domain/use_cases/get_settings.dart';

abstract class SettingsViewModel extends ChangeNotifier {
  Settings? get settings;
}

class SettingsViewModelImpl extends ChangeNotifier implements SettingsViewModel {
  final GetSettings getSettings;

  SettingsViewModelImpl(this.getSettings) {
    recoverSettings();
  }

  Settings? settings;

  Future recoverSettings() async {
    final result = await getSettings();

    result.fold(
      (r) => settings = r,
      (l) => {AsukaSnackbar.alert(l.toString()).show()},
    );
    notifyListeners();
  }
}
