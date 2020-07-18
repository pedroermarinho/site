import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:site/app/components/responsive/responsive_widget.dart';
import 'package:site/app/modules/home/pages/container1/container1_page.dart';
import 'package:site/app/modules/home/pages/container2/container2_page.dart';
import 'package:site/app/modules/home/pages/container3/container3_page.dart';
import 'package:site/app/modules/home/pages/container4/container4_page.dart';
import 'package:site/app/modules/home/pages/container5/container5_page.dart';
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
    return ResponsiveWidget(
      grandeScreen: Scaffold(
        body: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(6),
                  child: Container1Page(),
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Container(
                    child: ListView(
                      // mainAxisAlignment: MainAxisAlignment.start,
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
            Observer(builder: (_) => controller.projects),
            Observer(builder: (_) => controller.about),
            Positioned(
              top: 20,
              right: 20,
              child: SettingsModule(),
            ),
          ],
        ),
      ),
      pequenoScreen: Scaffold(
        body: PageView(
          controller: controller.pageViewController,
          children: [
            Container1Page(),
            Container2Page(),
            Container3Page(),
            Container4Page(),
            Container5Page(),
          ],
        ),
        bottomNavigationBar: AnimatedBuilder(
            animation: controller.pageViewController,
            builder: (context, snapshot) {
              return BottomNavigationBar(
                currentIndex: controller.pageViewController?.page?.round() ?? 0,
                onTap: (index) {
                  controller.pageViewController.jumpToPage(index);
                },
                items: [
                  BottomNavigationBarItem(
                    backgroundColor: Colors.black87,
                    icon: Icon(
                      Icons.person,
                      color: Colors.teal,
                    ),
                    title: Text(
                      "Perfil",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  BottomNavigationBarItem(
                    backgroundColor: Colors.black87,
                    icon: Icon(
                      Icons.business,
                      color: Colors.teal,
                    ),
                    title: Text(
                      "Emprego",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  BottomNavigationBarItem(
                    backgroundColor: Colors.black87,
                    icon: Icon(
                      Icons.school,
                      color: Colors.teal,
                    ),
                    title: Text(
                      "Educação",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  BottomNavigationBarItem(
                    backgroundColor: Colors.black87,
                    icon: Icon(
                      FontAwesomeIcons.github,
                      color: Colors.teal,
                    ),
                    title: Text(
                      "Projetos",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  BottomNavigationBarItem(
                    backgroundColor: Colors.black87,
                    icon: Icon(
                      FontAwesomeIcons.linkedinIn,
                      color: Colors.teal,
                    ),
                    title: Text(
                      "Redes",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              );
            }),
      ),
    );

// ListView(
//           children: [
//             Padding(
//               padding: EdgeInsets.all(6),
//               child: Container1Page(),
//             ),
//             SizedBox(
//               width: 5,
//             ),
//             Container2Page(),
//             Container3Page(),
//             Container4Page(),
//             Container5Page(),
//           ],
//         ),
    // Scaffold(
    //   body:
    //   bottomNavigationBar: BottomNavigationBar(

    //     items: [
    //       BottomNavigationBarItem(
    //         backgroundColor: Colors.black87,
    //         icon: Icon(Icons.home),
    //         title: Text("Home"),
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.home),
    //         title: Text("Home"),
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.home),
    //         title: Text("Home"),
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.home),
    //         title: Text("Home"),
    //       ),
    //     ],
    //   ),
    // );
  }
}
