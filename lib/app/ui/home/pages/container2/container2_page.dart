import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../ui/shared/components/loading_settings_data.dart';
import '../../../../ui/shared/components/responsive_widget.dart';
import '../../../shared/view_models/settings_viewmodel.dart';
import '../../components/jobs_information/jobs_information_widget.dart';
import '../../components/text_icon/text_icon_widget.dart';

class Container2Page extends StatefulWidget {
  @override
  _Container2PageState createState() => _Container2PageState();
}

class _Container2PageState extends State<Container2Page> {
  final _settingsStore = Modular.get<SettingsStore>();

  void update() => setState(() {});

  @override
  void initState() {
    super.initState();
    _settingsStore.addListener(update);
  }

  @override
  void dispose() {
    _settingsStore.removeListener(update);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => LoadingSettingsData(
        data: _settingsStore.settings,
        builder: (settings) => Padding(
          padding: EdgeInsets.all(6),
          child: Container(
            decoration: ResponsiveWidget.isPequenoScreen(context)
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
              padding: ResponsiveWidget.isPequenoScreen(context) ? EdgeInsets.all(10) : EdgeInsets.all(30),
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
