import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../../config/providers.dart';
import '../../domain/view_models/modal_viewmodel.dart';
import '../../domain/view_models/themes_viewmodel.dart';
import '../../utils/launch_url.dart';
import '../shared/components/build_command_widget.dart';
import '../shared/components/responsive_widget.dart';
import 'markdown_viewmodel.dart';

class MarkdownPage extends StatefulWidget {
  final ModalViewModel modalViewModel;
  final MarkdownViewModel markdownViewModel;
  final String pathMD;

  MarkdownPage({
    required this.modalViewModel,
    required this.markdownViewModel,
    required this.pathMD,
    super.key,
  }) {
    markdownViewModel.loadMD(pathMD);
  }

  factory MarkdownPage.open({required String pathMD, Key? key}) => MarkdownPage(
        key: key,
        modalViewModel: getIt(),
        markdownViewModel: getIt(),
        pathMD: pathMD,
      );

  static void openModal({required String pathMD, Key? key}) {
    final modal = MarkdownPage(
      key: key,
      modalViewModel: getIt(),
      markdownViewModel: getIt(),
      pathMD: pathMD,
    );

    modal.modalViewModel.openModal(modal);
  }

  @override
  _MarkdownPageState createState() => _MarkdownPageState();
}

class _MarkdownPageState extends State<MarkdownPage> {
  void update() => setState(() {});

  @override
  void initState() {
    super.initState();
    widget.modalViewModel.addListener(update);
    widget.markdownViewModel.addListener(update);
  }

  @override
  void dispose() {
    widget.modalViewModel.removeListener(update);
    widget.markdownViewModel.removeListener(update);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.all(ResponsiveWidget.isSmallScreen(context) ? 0 : 70),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            boxShadow: [
              BoxShadow(
                blurRadius: 6.0,
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: widget.modalViewModel.closeModal,
                  ),
                ],
              ),
              Expanded(
                child: BuildCommandWidget<String>(
                  command: widget.markdownViewModel.getMarkdownCommand,
                  success: (value) => Markdown(
                    styleSheet: ThemesViewModel.markdownStyleSheet(context),
                    data: value,
                    onTapLink: (text, href, title) {
                      launchURL(href);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
