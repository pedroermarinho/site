import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../../../../config/assets_path.dart';
import '../../../../utils/launch_url.dart';
import '../../components/responsive_widget.dart';
import '../../view_models/modal_viewmodel.dart';

class AboutPage extends StatefulWidget {
  final ModalViewModel modalViewModel;

  const AboutPage({required this.modalViewModel, super.key});

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  String appVersion = "Carregando...";

  @override
  void initState() {
    super.initState();
    _loadAppVersion();
  }

  Future<void> _loadAppVersion() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      appVersion = info.version;
    });
  }

  final String repositoryUrl = "https://github.com/pedroermarinho/site";
  final String creatorName = "Pedro Marinho";
  final String creatorGitHub = "https://github.com/pedroermarinho";
  final String creatorLinkedIn = "https://www.linkedin.com/in/pedroermarinho/";
  final String description = """
Este aplicativo foi desenvolvido utilizando **Flutter WEB** e é um **Progressive Web App (PWA)**. Ele possui como principais objetivos:

- Aprimorar habilidades no desenvolvimento Flutter.
- Servir como um site pessoal para apresentar minha trajetória como desenvolvedor.
- Testar e validar novas tecnologias no ecossistema Flutter.
- Funcionar como um currículo digital interativo.
- Demonstrar experiências profissionais e projetos do GitHub.

## Características Técnicas:
- Arquitetura baseada em **MVVM** (anteriormente Clean Architecture).
- Utilização da biblioteca **Result** para um tratamento de erros mais robusto e legível.
- Organização modular com separação clara de camadas (**UI**, **Domain**, **Data**, **Config**).
- Baseado em parte na arquitetura sugerida pela equipe do Flutter: [Documentação Oficial](https://docs.flutter.dev/app-architecture).

## Observações
O projeto está em constante evolução e serve como um laboratório para novas ideias e tecnologias.
""";

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final markdownStyle = MarkdownStyleSheet(
      h1: theme.textTheme.headlineLarge?.copyWith(color: theme.colorScheme.onSurface),
      h2: theme.textTheme.headlineMedium?.copyWith(color: theme.colorScheme.onSurface),
      h3: theme.textTheme.headlineSmall?.copyWith(color: theme.colorScheme.onSurface),
      p: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurface),
      a: theme.textTheme.bodyMedium?.copyWith(
        color: theme.colorScheme.primary,
        decoration: TextDecoration.underline,
      ),
      blockSpacing: 8.0,
      listBullet: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurface),
    );

    return Padding(
      padding: EdgeInsets.all(ResponsiveWidget.isSmallScreen(context) ? 20 : 70),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          boxShadow: [BoxShadow(blurRadius: 6.0)],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            // Header com botão de fechar
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
                  // Logo ou imagem
                  Center(
                    child: Image.asset(
                      AssetsPath.iconIMG,
                      height: 200,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Título
                  Center(
                    child: Text(
                      "Sobre o Aplicativo",
                      style: theme.textTheme.headlineSmall,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Versão
                  Center(
                    child: Text(
                      "Versão: $appVersion",
                      style: theme.textTheme.titleMedium,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Descrição em Markdown
                  MarkdownBody(
                    data: description,
                    styleSheet: markdownStyle,
                    onTapLink: (text, href, title) {
                      if (href != null) launchURL(href);
                    },
                  ),
                  const Divider(),
                  // Links Repositório e Criador
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
      }) => ListTile(
      leading: Icon(icon, color: Theme.of(context).colorScheme.primary),
      title: Text(title, style: Theme.of(context).textTheme.bodyLarge),
      subtitle: Text(
        subtitle,
        style: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(color: Theme.of(context).colorScheme.primary),
      ),
      onTap: () => launchURL(url),
    );
}
