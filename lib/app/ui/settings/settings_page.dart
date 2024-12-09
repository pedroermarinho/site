import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../config/environment.dart';
import 'settings_viewmodel.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final controller = Modular.get<SettingsViewModel>();

  void update() => setState(() {});

  @override
  void initState() {
    super.initState();
    controller.addListener(update);
  }

  @override
  void dispose() {
    controller.removeListener(update);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Container(
        height: 40,
        decoration: BoxDecoration(color: Colors.black54, borderRadius: BorderRadius.circular(30)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(
                controller.isThemeDark ? FontAwesomeIcons.solidSun : FontAwesomeIcons.solidMoon,
                color: Colors.white,
              ),
              onPressed: controller.changeTheme,
            ),
            IconButton(
              icon: Icon(
                FontAwesomeIcons.github,
                color: Colors.white,
              ),
              onPressed: controller.openProjects,
            ),
            if (!isProduction)
              IconButton(
                icon: Icon(
                  FontAwesomeIcons.book,
                  color: Colors.white,
                ),
                onPressed: controller.openMarkdown,
              ),
            IconButton(
              icon: Icon(
                FontAwesomeIcons.infoCircle,
                color: Colors.white,
              ),
              onPressed: controller.openAbout,
            ),
          ],
        ),
      );
}
