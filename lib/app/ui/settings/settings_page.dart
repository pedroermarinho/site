import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'settings_viewmodel.dart';

class SettingsPage extends StatefulWidget {
  final SettingsViewModel settingsViewModel;

  const SettingsPage({required this.settingsViewModel, super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  void update() => setState(() {});

  @override
  void initState() {
    super.initState();
    widget.settingsViewModel.addListener(update);
  }

  @override
  void dispose() {
    widget.settingsViewModel.removeListener(update);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Container(
        height: 40,
        decoration: BoxDecoration(color: Colors.black54, borderRadius: BorderRadius.circular(30)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Tooltip(
              message: "Alterar Tema",
              child: IconButton(
                icon: Icon(
                  widget.settingsViewModel.isThemeDark ? FontAwesomeIcons.solidSun : FontAwesomeIcons.solidMoon,
                  color: Colors.white,
                ),
                onPressed: widget.settingsViewModel.changeTheme,
              ),
            ),
            Tooltip(
              message: "Projetos do Github",
              child: IconButton(
                icon: Icon(
                  FontAwesomeIcons.github,
                  color: Colors.white,
                ),
                onPressed: widget.settingsViewModel.openProjects,
              ),
            ),
            Tooltip(
              message: "Baixar currículo em PDF",
              child: IconButton(
                icon: Icon(
                  FontAwesomeIcons.solidFilePdf,
                  color: Colors.white,
                ),
                onPressed: widget.settingsViewModel.downloadPdfFile,
              ),
            ),
            Tooltip(
              message: "Sobre",
              child: IconButton(
                icon: Icon(
                  FontAwesomeIcons.circleInfo,
                  color: Colors.white,
                ),
                onPressed: widget.settingsViewModel.openAbout,
              ),
            ),
          ],
        ),
      );
}
