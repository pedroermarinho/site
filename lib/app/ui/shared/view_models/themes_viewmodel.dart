import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/theme/theme_enum.dart';
import '../../../domain/entities/theme/themes.dart';
import '../../../domain/use_cases/get_theme.dart';
import '../../../domain/use_cases/set_theme.dart';

abstract class ThemesViewModel extends ChangeNotifier {
  ThemeData get themeActual;

  void setContext(BuildContext context);

  Future recoverTheme();

  Future changeTheme();

  bool get isDark;
}

class ThemesViewModelImpl extends ChangeNotifier implements ThemesViewModel {
  final GetTheme getTheme;
  final SetTheme setTheme;

  ThemeEnum theme = ThemeEnum.lightTheme;

  BuildContext? _context;

  ThemesViewModelImpl({required this.getTheme, required this.setTheme}) {
    recoverTheme();
  }

  void setContext(BuildContext context) {
    _context = context;
    notifyListeners();
  }

  bool get isDark => theme == ThemeEnum.darkTheme;

  Future recoverTheme() async {
    final result = await getTheme();

    result.fold(
      (r) => theme = r,
      (l) => theme = ThemeEnum.lightTheme,
    );
    notifyListeners();
  }

  ThemeData get themeActual {
    if (theme == ThemeEnum.darkTheme) {
      return darkTheme(_context!);
    } else {
      return lightTheme(_context!);
    }
  }

  Future changeTheme() async {
    if (theme == ThemeEnum.lightTheme) {
      theme = ThemeEnum.darkTheme;
    } else {
      theme = ThemeEnum.lightTheme;
    }
    final result = await setTheme(theme);

    result.fold(
      (r) => Asuka.showSnackBar(
        SnackBar(
          content: Text('Tema alterado'),
        ),
      ),
      (l) {
        Asuka.showSnackBar(SnackBar(content: Text(l.toString())));
      },
    );

    notifyListeners();
  }
}
