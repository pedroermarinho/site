import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:site/app/components/layout_custom/layout_custom_widget.dart';
import 'package:site/app/components/line/line_widget.dart';
import 'package:site/app/components/link/link_widget.dart';
import 'package:site/app/components/skills/skills_widget.dart';
import 'package:site/app/components/text_icon/text_icon_widget.dart';
import 'package:site/app/modules/home/pages/container1/container1_page.dart';
import 'package:site/app/modules/home/pages/container2/container2_page.dart';
import 'package:site/app/modules/home/pages/container3/container3_page.dart';
import 'package:site/app/modules/home/pages/container4/container4_page.dart';
import 'package:site/app/modules/home/pages/container5/container5_page.dart';

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
      body: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(6),
            child: Container1Page()
          ),
          SizedBox(
            width: 5,
          ),
          Expanded(
            child: Container(
              height: double.infinity,
              child: ListView(
                children: [
                  Container2Page(),
                  Container3Page(),
                  Container4Page(),
                  Container5Page(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
