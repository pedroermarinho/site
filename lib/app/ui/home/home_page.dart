import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../ui/shared/components/responsive_widget.dart';
import '../settings/settings_module.dart';
import 'home_viewmodel.dart';
import 'pages/container1/container1_page.dart';
import 'pages/container2/container2_page.dart';
import 'pages/container3/container3_page.dart';
import 'pages/container4/container4_page.dart';
import 'pages/container5/container5_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Modular.get<HomeController>();

  void update() => setState(() {});

  @override
  void initState() {
    super.initState();
    controller.addListener(update);
  }

  @override
  void dispose() {
    controller.pageViewController.dispose();
    controller.removeListener(update);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => ResponsiveWidget(
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
              controller.projects,
              controller.about,
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
            builder: (context, snapshot) => BottomNavigationBar(
              currentIndex: controller.pageViewController.page?.round() ?? 0,
              onTap: controller.pageViewController.jumpToPage,
              selectedItemColor: Colors.white,
              items: [
                BottomNavigationBarItem(
                  backgroundColor: Colors.black87,
                  icon: Icon(
                    Icons.person,
                    color: Colors.teal,
                  ),
                  label: "Perfil",
                ),
                BottomNavigationBarItem(
                  backgroundColor: Colors.black87,
                  icon: Icon(
                    Icons.business,
                    color: Colors.teal,
                  ),
                  label: "Emprego",
                ),
                BottomNavigationBarItem(
                  backgroundColor: Colors.black87,
                  icon: Icon(
                    Icons.school,
                    color: Colors.teal,
                  ),
                  label: "Educação",
                ),
                BottomNavigationBarItem(
                  backgroundColor: Colors.black87,
                  icon: Icon(
                    FontAwesomeIcons.github,
                    color: Colors.teal,
                  ),
                  label: "Projetos",
                ),
                BottomNavigationBarItem(
                  backgroundColor: Colors.black87,
                  icon: Icon(
                    FontAwesomeIcons.linkedinIn,
                    color: Colors.teal,
                  ),
                  label: "Redes",
                ),
              ],
            ),
          ),
        ),
      );
}
