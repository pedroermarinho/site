import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:site/app/components/layout_custom/layout_custom_widget.dart';
import 'package:site/app/components/responsive/responsive_widget.dart';
import 'package:site/app/modules/home/pages/container1/container1_page.dart';
import 'package:site/app/modules/home/pages/container2/container2_page.dart';
import 'package:site/app/modules/home/pages/container3/container3_page.dart';
import 'package:site/app/modules/home/pages/container4/container4_page.dart';
import 'package:site/app/modules/home/pages/container5/container5_page.dart';
import 'package:site/app/modules/projetcs/projetcs_module.dart';
import 'package:site/app/modules/settings/settings_module.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return LayoutCustomWidget(
      body: ResponsiveWidget(
        grandeScreen: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                    child: Padding(
                        padding: EdgeInsets.all(6), child: Container1Page())),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Container(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container2Page(),
                          Container3Page(),
                          Container4Page(),
                          Container5Page(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
           Observer(builder: (_)=>controller.projects),
           Observer(builder: (_)=>controller.about),
            Positioned(
              top: 20,
              right: 20,
              child: SettingsModule(),
            ),
          ],
        ),
        pequenoScreen: Stack(
          children: [
             ListView(
                children: [
                  Padding(padding: EdgeInsets.all(6), child: Container1Page()),
                  SizedBox(
                    width: 5,
                  ),
                  Container2Page(),
                  Container3Page(),
                  Container4Page(),
                  Container5Page(),

                ],
              ),

            Positioned(
              top: 20,
              right: 20,
              child: SettingsModule(),
            ),
            Observer(builder: (_)=>controller.projects),
            Observer(builder: (_)=>controller.about),
          ],

        ),
      ),
    );
  }
}
