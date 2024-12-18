import 'package:flutter/foundation.dart';

import '../entities/settings/settings.dart';

abstract class DataViewModel extends ChangeNotifier {
  Settings get settings;

  void updateSettings(Settings settings);
}

class DataViewModelImpl extends ChangeNotifier implements DataViewModel {
  late Settings settings;

  void updateSettings(Settings settings) {
    this.settings = settings;
    notifyListeners();
  }
}
