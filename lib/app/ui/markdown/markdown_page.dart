import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'markdown_viewmodel.dart';

class MarkdownPage extends StatefulWidget {
  @override
  _MarkdownPageState createState() => _MarkdownPageState();
}

class _MarkdownPageState extends State<MarkdownPage> {
  final controller = Modular.get<MarkdownController>();

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
        width: 150,
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
