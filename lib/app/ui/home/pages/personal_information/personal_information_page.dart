import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../domain/entities/settings/skills.dart';
import '../../../../domain/view_models/data_viewmodel.dart';
import '../../../../domain/view_models/themes_viewmodel.dart';
import '../../../../ui/shared/components/responsive_widget.dart';
import '../../components/line/line_widget.dart';
import '../../components/link/link_widget.dart';
import '../../components/skills/skills_widget.dart';
import '../../components/text_icon/text_icon_widget.dart';
import 'personal_information_viewmodel.dart';

class PersonalInformationPage extends StatefulWidget {
  final DataViewModel dataViewModel;
  final ThemesViewModel themesViewModel;
  final PersonalInformationViewModel personalInformationViewModel;

  const PersonalInformationPage({required this.dataViewModel, required this.themesViewModel, required this.personalInformationViewModel, super.key});

  @override
  _PersonalInformationPageState createState() => _PersonalInformationPageState();
}

class _PersonalInformationPageState extends State<PersonalInformationPage> {
  void update() => setState(() {});

  @override
  void initState() {
    super.initState();
    widget.themesViewModel.addListener(update);
    widget.dataViewModel.addListener(update);
  }

  @override
  void dispose() {
    widget.themesViewModel.removeListener(update);
    widget.dataViewModel.removeListener(update);
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
  Widget build(BuildContext context) {
    final settings = widget.dataViewModel.settings;
    return containerCustom(
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
                ResponsiveWidget.isSmallScreen(context) ? _settingsIcons() : Container(),
                Expanded(child: Container()),
                Container(
                  child: Text(
                    settings.name,
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.5),
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
            padding: EdgeInsets.only(
              left: 15,
              top: 15,
              bottom: 0,
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
                        name: "Principal",
                        isPrimary: true,
                      ),
                      SkillsWidget(
                        name: "Secundária",
                        isPrimary: false,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                ..._buildOrganizedSkills(widget.dataViewModel.settings.skills),
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
                        name: "Básico",
                        isPrimary: false,
                      ),
                      SkillsWidget(
                        name: "Nativo",
                        isPrimary: true,
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
                          name: language.name,
                          isPrimary: language.level == "native",
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
                    .map(
                      (link) => LinkWidget(
                        url: link.url,
                        text: link.name,
                      ),
                    )
                    .toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _settingsIcons() => Container(
        margin: EdgeInsets.only(top: 10, left: 10),
        width: 80,
        decoration: BoxDecoration(color: Colors.black54, borderRadius: BorderRadius.circular(30)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(
                widget.themesViewModel.isDark ? FontAwesomeIcons.solidSun : FontAwesomeIcons.solidMoon,
                color: Colors.white,
              ),
              onPressed: widget.themesViewModel.changeTheme,
            ),
            IconButton(
              icon: Icon(
                FontAwesomeIcons.solidFilePdf,
                color: Colors.white,
              ),
              onPressed: widget.personalInformationViewModel.downloadPdfFile,
            )
          ],
        ),
      );

  List<Widget> _buildOrganizedSkills(Skills skills) {
    final skillCategories = [
      {"title": "Linguagens", "primary": skills.primary.languages, "secondary": skills.secondary.languages},
      {"title": "Frameworks", "primary": skills.primary.frameworks, "secondary": skills.secondary.frameworks},
      {"title": "Ferramentas", "primary": skills.primary.tools, "secondary": skills.secondary.tools},
      {"title": "Plataformas", "primary": skills.primary.platforms, "secondary": skills.secondary.platforms},
      {"title": "Bancos de Dados", "primary": skills.primary.databases, "secondary": skills.secondary.databases},
      {"title": "Sistemas Operacionais", "primary": skills.primary.os, "secondary": skills.secondary.os},
    ];

    return skillCategories.map((category) {
      final title = category["title"] as String;
      final primary = category["primary"] as List<String>;
      final secondary = category["secondary"] as List<String>;

      if (primary.isEmpty && secondary.isEmpty) {
        return SizedBox.shrink();
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              title,
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              ...primary.map((name) => SkillsWidget(name: name, isPrimary: true)),
              ...secondary.map((name) => SkillsWidget(name: name, isPrimary: false)),
            ],
          ),
          SizedBox(height: 12),
          Divider(color: Colors.grey[300], thickness: 0.5, height: 1),
          SizedBox(height: 12),
        ],
      );
    }).toList();
  }
}
