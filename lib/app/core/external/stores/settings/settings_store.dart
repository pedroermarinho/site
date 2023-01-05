import 'package:asuka/asuka.dart';
import 'package:mobx/mobx.dart';

import '../../../domain/entities/settings/settings.dart';
import '../../../domain/usercases/get_settings.dart';

part 'settings_store.g.dart';

abstract class SettingsStore {
  Settings? get settings;
}

class SettingsStoreImpl = _SettingsStoreImplBase with _$SettingsStoreImpl;

abstract class _SettingsStoreImplBase with Store implements SettingsStore {
  final GetSettings getSettings;

  _SettingsStoreImplBase(this.getSettings) {
    recoverSettings();
  }

  @observable
  @override
  Settings? settings;

  @action
  Future recoverSettings() async {
    final result = await getSettings();

    result.fold(
      (l) => {AsukaSnackbar.alert(l.message).show()},
      (r) => settings = r,
    );
  }
}
