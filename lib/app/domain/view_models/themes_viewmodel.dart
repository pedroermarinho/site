import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../entities/theme/theme_enum.dart';
import '../entities/theme/themes.dart';
import '../errors/generic_errors.dart';
import '../use_cases/get_theme.dart';
import '../use_cases/set_theme.dart';

abstract class ThemesViewModel extends ChangeNotifier {
  ThemeData get themeActual;

  void setContext(BuildContext context);

  Future recoverTheme();

  Future changeTheme();

  bool get isDark;

  static MarkdownStyleSheet markdownStyleSheet(BuildContext context) {
    final theme = Theme.of(context);
    return MarkdownStyleSheet(
      h1: theme.textTheme.headlineLarge?.copyWith(color: theme.colorScheme.onSurface),
      h2: theme.textTheme.headlineMedium?.copyWith(color: theme.colorScheme.onSurface),
      h3: theme.textTheme.headlineSmall?.copyWith(color: theme.colorScheme.onSurface),
      p: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurface),
      a: theme.textTheme.bodyMedium?.copyWith(
        color: theme.colorScheme.primary,
        decoration: TextDecoration.underline,
      ),
      blockSpacing: 8.0,
      listBullet: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurface),
    );
  }
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
      (s) => theme = s,
      (e) => theme = ThemeEnum.lightTheme,
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
      (s) => Asuka.showSnackBar(
        SnackBar(
          content: Text('Tema alterado'),
        ),
      ),
      _errorTheme,
    );
    notifyListeners();
  }

  void _errorTheme(Exception e) {
    if (e is GenericFailure) {
      AsukaSnackbar.alert(e.message).show();
    } else {
      AsukaSnackbar.alert("Erro ao recuperar tema").show();
    }
  }
}
