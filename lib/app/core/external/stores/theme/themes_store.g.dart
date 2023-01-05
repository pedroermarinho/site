// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'themes_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ThemesStoreImpl on _ThemesStoreImplBase, Store {
  Computed<ThemeData>? _$themeActualComputed;

  @override
  ThemeData get themeActual =>
      (_$themeActualComputed ??= Computed<ThemeData>(() => super.themeActual,
              name: '_ThemesStoreImplBase.themeActual'))
          .value;

  late final _$themeAtom =
      Atom(name: '_ThemesStoreImplBase.theme', context: context);

  @override
  ThemeEnum get theme {
    _$themeAtom.reportRead();
    return super.theme;
  }

  @override
  set theme(ThemeEnum value) {
    _$themeAtom.reportWrite(value, super.theme, () {
      super.theme = value;
    });
  }

  late final _$changeThemeAsyncAction =
      AsyncAction('_ThemesStoreImplBase.changeTheme', context: context);

  @override
  Future<dynamic> changeTheme() {
    return _$changeThemeAsyncAction.run(() => super.changeTheme());
  }

  late final _$_ThemesStoreImplBaseActionController =
      ActionController(name: '_ThemesStoreImplBase', context: context);

  @override
  void setContext(BuildContext context) {
    final _$actionInfo = _$_ThemesStoreImplBaseActionController.startAction(
        name: '_ThemesStoreImplBase.setContext');
    try {
      return super.setContext(context);
    } finally {
      _$_ThemesStoreImplBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
theme: ${theme},
themeActual: ${themeActual}
    ''';
  }
}
