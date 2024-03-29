// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SettingsController on _SettingsControllerBase, Store {
  Computed<bool>? _$isThemeDarkComputed;

  @override
  bool get isThemeDark =>
      (_$isThemeDarkComputed ??= Computed<bool>(() => super.isThemeDark,
              name: '_SettingsControllerBase.isThemeDark'))
          .value;

  late final _$_SettingsControllerBaseActionController =
      ActionController(name: '_SettingsControllerBase', context: context);

  @override
  void changeTheme() {
    final _$actionInfo = _$_SettingsControllerBaseActionController.startAction(
        name: '_SettingsControllerBase.changeTheme');
    try {
      return super.changeTheme();
    } finally {
      _$_SettingsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void openProjects() {
    final _$actionInfo = _$_SettingsControllerBaseActionController.startAction(
        name: '_SettingsControllerBase.openProjects');
    try {
      return super.openProjects();
    } finally {
      _$_SettingsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void openAbout() {
    final _$actionInfo = _$_SettingsControllerBaseActionController.startAction(
        name: '_SettingsControllerBase.openAbout');
    try {
      return super.openAbout();
    } finally {
      _$_SettingsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isThemeDark: ${isThemeDark}
    ''';
  }
}
