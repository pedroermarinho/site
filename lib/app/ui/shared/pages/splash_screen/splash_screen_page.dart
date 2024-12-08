import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../config/assets_path.dart';
import 'splash_screen_viewmodel.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  final controller = Modular.get<SplashScreenController>();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1)).then((value) => controller.pushHome());
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          padding: EdgeInsets.all(20),
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 90),
                  child: Image.asset(
                    AssetsPath.iconIMG,
                    width: 250,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
