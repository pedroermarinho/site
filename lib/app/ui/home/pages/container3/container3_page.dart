import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../ui/shared/components/loading_settings_data.dart';
import '../../../../ui/shared/components/responsive_widget.dart';
import '../../../shared/view_models/settings_viewmodel.dart';
import '../../components/academic_information/academic_information_widget.dart';
import '../../components/text_icon/text_icon_widget.dart';

class Container3Page extends StatefulWidget {
  @override
  _Container3PageState createState() => _Container3PageState();
}

class _Container3PageState extends State<Container3Page> {
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
                    text: "Educação",
                    icon: Icons.school,
                    sizeIcon: 40,
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  SizedBox(height: 55),
                  ...settings.academic.map(
                    (academic) => AcademicInformationWidget(academic: academic),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
