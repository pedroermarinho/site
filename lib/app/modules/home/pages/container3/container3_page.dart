import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/external/stores/settings/settings_store.dart';
import '../../../../core/presenter/components/loading_senttings_data.dart';
import '../../../../core/presenter/components/responsive_widget.dart';
import '../../components/academic_information/academic_information_widget.dart';
import '../../components/text_icon/text_icon_widget.dart';
import 'container3_controller.dart';

class Container3Page extends StatefulWidget {
  @override
  _Container3PageState createState() => _Container3PageState();
}

class _Container3PageState extends State<Container3Page> {
  final controller = Modular.get<Container3Controller>();
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
                      color: Theme.of(context).backgroundColor,
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
                      text: "Educação",
                      icon: Icons.school,
                      sizeIcon: 40,
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    SizedBox(height: 55),
                    ...settings.academic.map(
                      (academic) =>
                          AcademicInformationWidget(academic: academic),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
