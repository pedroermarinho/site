import 'package:flutter/material.dart';

import '../../../../ui/shared/components/loading_settings_data.dart';
import '../../../../ui/shared/components/responsive_widget.dart';
import '../../../shared/view_models/settings_viewmodel.dart';
import '../../components/jobs_information/jobs_information_widget.dart';
import '../../components/text_icon/text_icon_widget.dart';

class Container2Page extends StatefulWidget {
  final SettingsViewModel settingsViewModel;

  const Container2Page({required this.settingsViewModel, super.key});

  @override
  _Container2PageState createState() => _Container2PageState();
}

class _Container2PageState extends State<Container2Page> {
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
                    text: "Experiência de Trabalho",
                    icon: Icons.business,
                    sizeIcon: 40,
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  SizedBox(height: 55),
                  ...settings.jobs.map((job) => JobsInformationWidget(jobs: job)),
                ],
              ),
            ),
          ),
        ),
      );
}
