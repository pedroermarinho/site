import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../config/assets_path.dart';
import '../../../../domain/entities/settings/settings.dart';
import '../../components/build_command_widget.dart';
import 'splash_screen_viewmodel.dart';

class SplashScreenPage extends StatefulWidget {
  final SplashScreenViewModel splashScreenViewModel;

  const SplashScreenPage({required this.splashScreenViewModel, super.key});

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  void update() => setState(() {});

  @override
  void initState() {
    super.initState();
    widget.splashScreenViewModel.addListener(update);
    widget.splashScreenViewModel.listenSettings(context);
  }

  @override
  void dispose() {
    widget.splashScreenViewModel.removeListener(update);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          padding: EdgeInsets.all(20),
          color: Colors.white,
          child: Center(
            child: BuildCommandWidget<Settings>(
              command: widget.splashScreenViewModel.getSettingsCommand,
              success: (value) => Icon(FontAwesomeIcons.check),
              loading: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 90),
                    child: Image.asset(
                      AssetsPath.iconIMG,
                      width: 250,
                    ),
                  ),
                  Text("Carregando informações"),
                ],
              ),
              failure: (error) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 90),
                    child: Image.asset(
                      AssetsPath.inspectocatIMG,
                      width: 250,
                    ),
                  ),
                  Text(error),
                ],
              ),
            ),
          ),
        ),
      );
}
