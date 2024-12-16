import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../ui/shared/components/loading_settings_data.dart';
import '../../../../ui/shared/components/responsive_widget.dart';
import '../../../shared/view_models/settings_viewmodel.dart';
import '../../components/item_project/item_project_widget.dart';
import '../../components/text_icon/text_icon_widget.dart';
import 'container4_viewmodel.dart';

class Container4Page extends StatefulWidget {
  final Container4ViewModel container4ViewModel;
  final SettingsViewModel settingsViewModel;

  const Container4Page({required this.container4ViewModel, required this.settingsViewModel, super.key});

  @override
  _Container4PageState createState() => _Container4PageState();
}

class _Container4PageState extends State<Container4Page> {
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
  Widget build(BuildContext context) => LoadingSettingsData(
        data: widget.settingsViewModel.settings,
        builder: (settings) => Padding(
          padding: EdgeInsets.all(6),
          child: Container(
            decoration: ResponsiveWidget.isSmallScreen(context)
                ? null
                : BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
            child: Padding(
              padding: ResponsiveWidget.isSmallScreen(context) ? EdgeInsets.all(10) : EdgeInsets.all(30),
              child: ResponsiveWidget.listViewOrColumn(
                context,
                children: [
                  TextIconWidget(
                    text: "Projetos",
                    icon: FontAwesomeIcons.github,
                    sizeIcon: 40,
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  SizedBox(height: 55),
                  ...settings.projects.map((e) => ItemProjectWidget(projects: e)),
                  ResponsiveWidget.isSmallScreen(context)
                      ? Center(
                          child: TextButton(
                            onPressed: () => widget.container4ViewModel.pushProjects(context),
                            child: Text("Mais Projetos"),
                          ),
                        )
                      : Container()
                ],
              ),
            ),
          ),
        ),
      );
}
