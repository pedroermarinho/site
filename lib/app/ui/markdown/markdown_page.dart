import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../shared/components/responsive_widget.dart';
import 'markdown_viewmodel.dart';

class MarkdownPage extends StatefulWidget {
  @override
  _MarkdownPageState createState() => _MarkdownPageState();
}

class _MarkdownPageState extends State<MarkdownPage> {
  final controller = Modular.get<MarkdownController>();

  void update() => setState(() {});

  @override
  void initState() {
    super.initState();
    controller.addListener(update);
  }

  @override
  void dispose() {
    controller.removeListener(update);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => ResponsiveWidget(
        largeScreen: Padding(
          padding: EdgeInsets.all(70),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
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
                      onPressed: controller.closeMarkdown,
                    ),
                  ],
                ),

                // const Markdown(data: '## Markdown'),
                Expanded(child: _buildMarkdown()),
              ],
            ),
          ),
        ),
        smallScreen: Scaffold(
          body: Container(
            child: Column(
              children: [
                Expanded(child: _buildMarkdown()),
              ],
            ),
          ),
        ),
      );

  Widget _buildMarkdown() {
    return Markdown(
      data: """
           ### **Teste**
       """,
    );
  }
}
