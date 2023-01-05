// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SettingsStoreImpl on _SettingsStoreImplBase, Store {
  late final _$settingsAtom =
      Atom(name: '_SettingsStoreImplBase.settings', context: context);

  @override
  Settings? get settings {
    _$settingsAtom.reportRead();
    return super.settings;
  }

  @override
  set settings(Settings? value) {
    _$settingsAtom.reportWrite(value, super.settings, () {
      super.settings = value;
    });
  }

  late final _$recoverSettingsAsyncAction =
      AsyncAction('_SettingsStoreImplBase.recoverSettings', context: context);

  @override
  Future<dynamic> recoverSettings() {
    return _$recoverSettingsAsyncAction.run(() => super.recoverSettings());
  }

  @override
  String toString() {
    return '''
settings: ${settings}
    ''';
  }
}
