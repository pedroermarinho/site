import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/external/stores/settings/settings_store.dart';
import '../../../../core/infra/utils/launch_url.dart';
import '../../../../core/presenter/components/loading_senttings_data.dart';
import '../../../../core/presenter/components/responsive_widget.dart';
import '../../components/line/line_widget.dart';
import 'container5_controller.dart';

class Container5Page extends StatefulWidget {
  @override
  _Container5PageState createState() => _Container5PageState();
}

class _Container5PageState extends State<Container5Page> {
  final controller = Modular.get<Container5Controller>();
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
                child: Wrap(
                  direction: Axis.horizontal,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  alignment: WrapAlignment.center,
                  children: [
                    Visibility(
                      visible: settings.socialNetworks.github != null,
                      child: IconButton(
                        icon: Icon(FontAwesomeIcons.squareGithub),
                        onPressed: () => launchURL(
                            'https://github.com/${settings.socialNetworks.github}'),
                        iconSize: 100,
                      ),
                    ),
                    Visibility(
                      visible: settings.socialNetworks.instagram != null,
                      child: IconButton(
                        icon: Icon(FontAwesomeIcons.squareInstagram),
                        onPressed: () => launchURL(
                            'https://instagram.com/${settings.socialNetworks.instagram}'),
                        iconSize: 100,
                      ),
                    ),
                    Visibility(
                      visible: settings.socialNetworks.linkedin != null,
                      child: IconButton(
                        icon: Icon(FontAwesomeIcons.linkedin),
                        onPressed: () => launchURL(
                            'https://linkedin.com/in/${settings.socialNetworks.linkedin}'),
                        iconSize: 100,
                      ),
                    ),
                    Visibility(
                      visible: settings.socialNetworks.youtube != null,
                      child: IconButton(
                        icon: Icon(FontAwesomeIcons.squareYoutube),
                        onPressed: () => launchURL(
                            'https://youtube.com/${settings.socialNetworks.youtube}'),
                        iconSize: 100,
                      ),
                    ),
                    Visibility(
                      visible: settings.socialNetworks.twitter != null,
                      child: IconButton(
                        icon: Icon(FontAwesomeIcons.squareTwitter),
                        onPressed: () => launchURL(
                            'https://twitter.com/${settings.socialNetworks.twitter}'),
                        iconSize: 100,
                      ),
                    ),
                    Visibility(
                      visible: settings.socialNetworks.facebook != null,
                      child: IconButton(
                        icon: Icon(FontAwesomeIcons.squareFacebook),
                        onPressed: () => launchURL(
                            'https://facebook.com/${settings.socialNetworks.facebook}'),
                        iconSize: 100,
                      ),
                    ),
                    ResponsiveWidget.isPequenoScreen(context)
                        ? Container()
                        : LineWidget(color: Colors.transparent)
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
