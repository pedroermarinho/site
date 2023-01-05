import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../domain/entities/theme/theme_enum.dart';
import '../../../domain/entities/theme/themes.dart';
import '../../../domain/usercases/get_theme.dart';
import '../../../domain/usercases/set_theme.dart';

part 'themes_store.g.dart';

abstract class ThemesStore {
  ThemeData get themeActual;

  void setContext(BuildContext context);

  Future recoverTheme();

  Future changeTheme();

  bool get isDark;
}

class ThemesStoreImpl = _ThemesStoreImplBase with _$ThemesStoreImpl;

abstract class _ThemesStoreImplBase with Store implements ThemesStore {
  final GetTheme getTheme;
  final SetTheme setTheme;

  @observable
  ThemeEnum theme = ThemeEnum.lightTheme;

  BuildContext? _context;

  @action
  void setContext(BuildContext context) => _context = context;

  _ThemesStoreImplBase({required this.getTheme, required this.setTheme}) {
    recoverTheme();
  }

  bool get isDark => theme == ThemeEnum.darkTheme;

  Future recoverTheme() async {
    final result = await getTheme();

    result.fold(
      (l) => theme = ThemeEnum.lightTheme,
      (r) => theme = r,
    );
  }

  @computed
  ThemeData get themeActual {
    if (theme == ThemeEnum.darkTheme) {
      return darkTheme(_context!);
    } else {
      return lightTheme(_context!);
    }
  }

  @action
  Future changeTheme() async {
    if (theme == ThemeEnum.lightTheme) {
      theme = ThemeEnum.darkTheme;
    } else {
      theme = ThemeEnum.lightTheme;
    }
    final result = await setTheme(theme);

    result.fold((l) {
      Asuka.showSnackBar(SnackBar(content: Text(l.message)));
    }, (r) => Asuka.showSnackBar(SnackBar(content: Text('Tema alterado'))));
  }
}
