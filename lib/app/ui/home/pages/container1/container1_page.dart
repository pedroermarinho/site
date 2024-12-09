import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../domain/entities/settings/skills.dart';
import '../../../../ui/shared/components/responsive_widget.dart';
import '../../../shared/components/loading_settings_data.dart';
import '../../../shared/view_models/settings_viewmodel.dart';
import '../../../shared/view_models/themes_viewmodel.dart';
import '../../components/line/line_widget.dart';
import '../../components/link/link_widget.dart';
import '../../components/skills/skills_widget.dart';
import '../../components/text_icon/text_icon_widget.dart';

class Container1Page extends StatefulWidget {
  @override
  _Container1PageState createState() => _Container1PageState();
}

class _Container1PageState extends State<Container1Page> {
  final _settingsStore = Modular.get<SettingsStoreImpl>();
  final _themesController = Modular.get<ThemesStore>();

  void update() => setState(() {});

  @override
  void initState() {
    super.initState();
    _themesController.addListener(update);
    _settingsStore.addListener(update);
  }

  @override
  void dispose() {
    _themesController.removeListener(update);
    _settingsStore.removeListener(update);
    super.dispose();
  }

  Widget containerCustom(BuildContext context, {required Widget child}) => ResponsiveWidget(
      largeScreen: Container(
        constraints: BoxConstraints(
          maxWidth: 430,
          minWidth: 200,
          minHeight: 200,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          boxShadow: [
            BoxShadow(
              blurRadius: 6.0,
            ),
          ],
        ),
        child: child,
      ),
      smallScreen: child);

  @override
  Widget build(BuildContext context) => LoadingSettingsData(
        data: _settingsStore.settings,
        builder: (settings) => containerCustom(
          context,
          child: ListView(
            children: [
              Container(
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                    image: NetworkImage(settings.photo),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ResponsiveWidget.isSmallScreen(context)
                        ? IconButton(
                            icon: Icon(
                              _themesController.isDark ? FontAwesomeIcons.solidSun : FontAwesomeIcons.solidMoon,
                              color: Colors.white,
                            ),
                            onPressed: _themesController.changeTheme,
                          )
                        : Container(),
                    Expanded(child: Container()),
                    Container(
                      child: Text(
                        settings.name,
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                      ),
                      padding: EdgeInsets.all(4),
                    ),
                    LineWidget(color: Colors.transparent)
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  left: 15,
                  top: 15,
                  bottom: 20,
                ),
                child: Column(
                  children: [
                    TextIconWidget(
                      text: settings.role,
                      icon: Icons.business_center,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextIconWidget(
                      text: settings.location,
                      icon: Icons.home,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextIconWidget(
                      text: settings.email,
                      icon: Icons.email,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextIconWidget(
                      text: settings.phone.fullNumber,
                      icon: Icons.phone,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
              LineWidget(),
              Container(
//                  color: Colors.amber,
                padding: EdgeInsets.only(
                  left: 15,
                  top: 15,
                  bottom: 20,
                ),
                child: Column(
                  children: [
                    TextIconWidget(
                      text: "Habilidades",
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      child: Wrap(
                        direction: Axis.horizontal,
                        spacing: 5,
                        runSpacing: 5,
                        children: [
                          SkillsWidget(
                            skills: Skills(
                              name: "Básico",
                              level: "basic",
                            ),
                          ),
                          SkillsWidget(
                            skills: Skills(
                              name: "Intermediário",
                              level: "intermediary",
                            ),
                          ),
                          SkillsWidget(
                            skills: Skills(
                              name: "Avançado",
                              level: "advanced",
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Wrap(
                      alignment: WrapAlignment.center,
                      direction: Axis.horizontal,
                      spacing: 10,
                      runSpacing: 10,
                      children: settings.skills.map((skill) => SkillsWidget(skills: skill)).toList(),
                    ),
                  ],
                ),
              ),
              LineWidget(),
              Container(
                padding: EdgeInsets.only(
                  left: 15,
                  top: 15,
                  bottom: 20,
                ),
                child: Column(
                  children: [
                    TextIconWidget(
                      text: "Línguas",
                      icon: Icons.language,
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      child: Wrap(
                        direction: Axis.horizontal,
                        spacing: 5,
                        runSpacing: 5,
                        children: [
                          SkillsWidget(
                            skills: Skills(
                              name: "Básico",
                              level: "basic",
                            ),
                          ),
                          SkillsWidget(
                            skills: Skills(
                              name: "Intermediário",
                              level: "intermediary",
                            ),
                          ),
                          SkillsWidget(
                            skills: Skills(
                              name: "Avançado",
                              level: "advanced",
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Wrap(
                      alignment: WrapAlignment.start,
                      direction: Axis.horizontal,
                      spacing: 10,
                      runSpacing: 10,
                      children: settings.languages
                          .map(
                            (language) => SkillsWidget(
                              skills: language,
                            ),
                          )
                          .toList(),
                    )
                  ],
                ),
              ),
              LineWidget(),
              Container(
                padding: EdgeInsets.only(
                  left: 15,
                  top: 15,
                  bottom: 20,
                ),
                child: Column(
                  children: [
                    TextIconWidget(
                      text: "Links Relacionados",
                      icon: Icons.link,
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ...settings.links
                        .map((link) => LinkWidget(
                              url: link.url,
                              text: link.name,
                            ))
                        .toList(),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
