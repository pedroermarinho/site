import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../infra/utils/assets_path.dart';
import '../../components/responsive_widget.dart';
import 'about_controller.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  final controller = Modular.get<AboutController>();
  @override
  Widget build(BuildContext context) => Padding(
        padding:
            EdgeInsets.all(ResponsiveWidget.isPequenoScreen(context) ? 20 : 70),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
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
                    onPressed: controller.closeAbout,
                  ),
                ],
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.only(top: 20),
                  children: <Widget>[
                    Center(
                      child: Image.asset(
                        AssetsPath.iconIMG,
                        height: 300,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
