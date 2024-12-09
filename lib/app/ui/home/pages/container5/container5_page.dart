import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../ui/shared/components/loading_settings_data.dart';
import '../../../../ui/shared/components/responsive_widget.dart';
import '../../../../utils/launch_url.dart';
import '../../../shared/view_models/settings_viewmodel.dart';
import '../../components/line/line_widget.dart';

class Container5Page extends StatefulWidget {
  @override
  _Container5PageState createState() => _Container5PageState();
}

class _Container5PageState extends State<Container5Page> {
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
              child: Wrap(
                direction: Axis.horizontal,
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.center,
                children: [
                  Visibility(
                    visible: settings.socialNetworks.github != null,
                    child: IconButton(
                      icon: Icon(FontAwesomeIcons.squareGithub),
                      onPressed: () => launchURL('https://github.com/${settings.socialNetworks.github}'),
                      iconSize: 100,
                    ),
                  ),
                  Visibility(
                    visible: settings.socialNetworks.instagram != null,
                    child: IconButton(
                      icon: Icon(FontAwesomeIcons.squareInstagram),
                      onPressed: () => launchURL('https://instagram.com/${settings.socialNetworks.instagram}'),
                      iconSize: 100,
                    ),
                  ),
                  Visibility(
                    visible: settings.socialNetworks.linkedin != null,
                    child: IconButton(
                      icon: Icon(FontAwesomeIcons.linkedin),
                      onPressed: () => launchURL('https://linkedin.com/in/${settings.socialNetworks.linkedin}'),
                      iconSize: 100,
                    ),
                  ),
                  Visibility(
                    visible: settings.socialNetworks.youtube != null,
                    child: IconButton(
                      icon: Icon(FontAwesomeIcons.squareYoutube),
                      onPressed: () => launchURL('https://youtube.com/${settings.socialNetworks.youtube}'),
                      iconSize: 100,
                    ),
                  ),
                  Visibility(
                    visible: settings.socialNetworks.twitter != null,
                    child: IconButton(
                      icon: Icon(FontAwesomeIcons.squareTwitter),
                      onPressed: () => launchURL('https://twitter.com/${settings.socialNetworks.twitter}'),
                      iconSize: 100,
                    ),
                  ),
                  Visibility(
                    visible: settings.socialNetworks.facebook != null,
                    child: IconButton(
                      icon: Icon(FontAwesomeIcons.squareFacebook),
                      onPressed: () => launchURL('https://facebook.com/${settings.socialNetworks.facebook}'),
                      iconSize: 100,
                    ),
                  ),
                  ResponsiveWidget.isSmallScreen(context) ? Container() : LineWidget(color: Colors.transparent)
                ],
              ),
            ),
          ),
        ),
      );
}
