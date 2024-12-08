import 'package:asuka/asuka.dart';
import 'package:flutter/foundation.dart';

import '../../../domain/entities/settings/settings.dart';
import '../../../domain/use_cases/get_settings.dart';

abstract class SettingsStore extends ChangeNotifier {
  Settings? get settings;
}

class SettingsStoreImpl extends ChangeNotifier implements SettingsStore {
  final GetSettings getSettings;

  SettingsStoreImpl(this.getSettings) {
    recoverSettings();
  }

  Settings? settings;

  Future recoverSettings() async {
    final result = await getSettings();

    result.fold(
      (l) => {AsukaSnackbar.alert(l.message).show()},
      (r) => settings = r,
    );
    notifyListeners();
  }
}
