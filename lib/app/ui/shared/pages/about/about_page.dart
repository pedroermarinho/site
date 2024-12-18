import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../config/assets_path.dart';
import '../../../../domain/view_models/modal_viewmodel.dart';
import '../../../../domain/view_models/themes_viewmodel.dart';
import '../../../../utils/launch_url.dart';
import '../../components/build_command_widget.dart';
import '../../components/responsive_widget.dart';
import 'about_viewmodel.dart';

class AboutPage extends StatefulWidget {
  final ModalViewModel modalViewModel;
  final AboutViewModel aboutViewModel;

  const AboutPage({required this.modalViewModel, required this.aboutViewModel, super.key});

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  void update() => setState(() {});

  @override
  void initState() {
    super.initState();
    widget.modalViewModel.addListener(update);
  }

  @override
  void dispose() {
    widget.modalViewModel.removeListener(update);
    super.dispose();
  }

  final String repositoryUrl = "https://github.com/pedroermarinho/site";
  final String creatorName = "Pedro Marinho";
  final String creatorGitHub = "https://github.com/pedroermarinho";
  final String creatorLinkedIn = "https://www.linkedin.com/in/pedroermarinho/";

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final markdownStyle = ThemesViewModel.markdownStyleSheet(context);
    final isSmallScreen = ResponsiveWidget.isSmallScreen(context);
    return Padding(
      padding: EdgeInsets.all(isSmallScreen ? 0 : 70),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          boxShadow: [BoxShadow(blurRadius: 6.0)],
          borderRadius: isSmallScreen ? null : BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: widget.modalViewModel.closeModal,
                ),
              ],
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  Center(
                    child: Image.asset(
                      AssetsPath.iconIMG,
                      height: 200,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: Text(
                      "Sobre o Aplicativo",
                      style: theme.textTheme.headlineSmall,
                    ),
                  ),
                  const SizedBox(height: 10),
                  BuildCommandWidget<String>(
                    command: widget.aboutViewModel.getVersionCommand,
                    success: (value) => Center(
                      child: Text(
                        "Versão: $value",
                        style: theme.textTheme.titleMedium,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  BuildCommandWidget<String>(
                    command: widget.aboutViewModel.getAboutCommand,
                    success: (value) => MarkdownBody(
                      data: value,
                      styleSheet: markdownStyle,
                      onTapLink: (text, href, title) {
                        if (href != null) {
                          launchURL(href);
                        }
                      },
                    ),
                  ),
                  const Divider(),
                  _buildLinkTile(
                    context,
                    icon: FontAwesomeIcons.github,
                    title: "Repositório no GitHub",
                    subtitle: repositoryUrl,
                    url: repositoryUrl,
                  ),
                  _buildLinkTile(
                    context,
                    icon: Icons.person,
                    title: "Criador",
                    subtitle: creatorName,
                    url: creatorGitHub,
                  ),
                  _buildLinkTile(
                    context,
                    icon: FontAwesomeIcons.linkedin,
                    title: "Perfil no LinkedIn",
                    subtitle: "Pedro Marinho",
                    url: creatorLinkedIn,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLinkTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required String url,
  }) =>
      ListTile(
        leading: Icon(icon, color: Theme.of(context).colorScheme.primary),
        title: Text(title, style: Theme.of(context).textTheme.bodyLarge),
        subtitle: Text(
          subtitle,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.primary),
        ),
        onTap: () => launchURL(url),
      );
}
