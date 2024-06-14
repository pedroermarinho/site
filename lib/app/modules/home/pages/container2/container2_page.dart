import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/external/stores/settings/settings_store.dart';
import '../../../../core/presenter/components/loading_senttings_data.dart';
import '../../../../core/presenter/components/responsive_widget.dart';
import '../../components/jobs_information/jobs_information_widget.dart';
import '../../components/line/line_widget.dart';
import '../../components/text_icon/text_icon_widget.dart';
import 'container2_controller.dart';

class Container2Page extends StatefulWidget {
  @override
  _Container2PageState createState() => _Container2PageState();
}

class _Container2PageState extends State<Container2Page> {
  final controller = Modular.get<Container2Controller>();
  final _settingsStore = Modular.get<SettingsStore>();

  @override
  Widget build(BuildContext context) => Observer(
      builder: (_) => LoadingSettingsData(
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
                  padding: ResponsiveWidget.isPequenoScreen(context)
                      ? EdgeInsets.all(10)
                      : EdgeInsets.all(30),
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
                      ...settings.jobs
                          .map((job) => JobsInformationWidget(jobs: job)),
                    ],
                  ),
                ),
              ),
            ),
          ));
}
