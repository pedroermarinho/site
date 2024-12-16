import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../config/environment.dart';
import '../../config/providers.dart';
import '../../ui/shared/components/responsive_widget.dart';
import '../markdown/markdown_page.dart';
import '../settings/settings_page.dart';
import '../shared/view_models/modal_viewmodel.dart';
import 'home_viewmodel.dart';
import 'pages/container1/container1_page.dart';
import 'pages/container2/container2_page.dart';
import 'pages/container3/container3_page.dart';
import 'pages/container4/container4_page.dart';
import 'pages/container5/container5_page.dart';

class HomePage extends StatefulWidget {
  final HomeViewModel homeViewModel;
  final ModalViewModel modalViewModel;

  const HomePage({required this.homeViewModel, required this.modalViewModel, super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void update() => setState(() {});

  @override
  void initState() {
    super.initState();
    widget.modalViewModel.addListener(update);
  }

  @override
  void dispose() {
    widget.homeViewModel.pageViewController.dispose();
    widget.modalViewModel.removeListener(update);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => ResponsiveWidget(
        largeScreen: Scaffold(
          body: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(6),
                    child: Container1Page(
                      settingsViewModel: getIt(),
                      themesViewModel: getIt(),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Container(
                      child: ListView(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container2Page(
                            settingsViewModel: getIt(),
                          ),
                          Container3Page(
                            settingsViewModel: getIt(),
                          ),
                          Container4Page(
                            container4ViewModel: getIt(),
                            settingsViewModel: getIt(),
                          ),
                          Container5Page(
                            settingsViewModel: getIt(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              widget.modalViewModel.modal,
              Positioned(
                top: 20,
                right: 20,
                child: SettingsPage(settingsViewModel: getIt()),
              ),
            ],
          ),
        ),
        smallScreen: Scaffold(
          body: PageView(
            controller: widget.homeViewModel.pageViewController,
            children: [
              Container1Page(
                themesViewModel: getIt(),
                settingsViewModel: getIt(),
              ),
              Container2Page(
                settingsViewModel: getIt(),
              ),
              Container3Page(
                settingsViewModel: getIt(),
              ),
              Container4Page(
                settingsViewModel: getIt(),
                container4ViewModel: getIt(),
              ),
              if (!isProduction) MarkdownPage(modalViewModel: getIt()),
              Container5Page(
                settingsViewModel: getIt(),
              ),
            ],
          ),
          bottomNavigationBar: AnimatedBuilder(
            animation: widget.homeViewModel.pageViewController,
            builder: (context, snapshot) => BottomNavigationBar(
              currentIndex: widget.homeViewModel.pageViewController.page?.round() ?? 0,
              onTap: widget.homeViewModel.pageViewController.jumpToPage,
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
                if (!isProduction)
                  BottomNavigationBarItem(
                    backgroundColor: Colors.black87,
                    icon: Icon(
                      FontAwesomeIcons.book,
                      color: Colors.teal,
                    ),
                    label: "Markdown",
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
