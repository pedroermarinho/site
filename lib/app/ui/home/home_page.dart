import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../config/providers.dart';
import '../../domain/view_models/modal_viewmodel.dart';
import '../../ui/shared/components/responsive_widget.dart';
import '../settings/settings_page.dart';
import 'home_viewmodel.dart';
import 'pages/academic/academic_page.dart';
import 'pages/personal_information/personal_information_page.dart';
import 'pages/personal_project/personal_project_page.dart';
import 'pages/personal_summary/personal_summary_page.dart';
import 'pages/social_links/social_links_page.dart';
import 'pages/work_experience/work_experience_page.dart';

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
                    child: PersonalInformationPage(
                      dataViewModel: getIt(),
                      themesViewModel: getIt(),
                      personalInformationViewModel: getIt(),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Container(
                      child: ListView(
                        children: [
                          PersonalSummaryPage(
                            dataViewModel: getIt(),
                          ),
                          WorkExperiencePage(
                            dataViewModel: getIt(),
                          ),
                          AcademicPage(
                            dataViewModel: getIt(),
                          ),
                          PersonalProjectPage(
                            personalProjectViewModel: getIt(),
                            dataViewModel: getIt(),
                          ),
                          SocialLinksPage(
                            dataViewModel: getIt(),
                            socialLinksViewModel: getIt(),
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
          body: Stack(
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                child: PageView(
                  controller: widget.homeViewModel.pageViewController,
                  children: [
                    PersonalInformationPage(
                      themesViewModel: getIt(),
                      dataViewModel: getIt(),
                      personalInformationViewModel: getIt(),
                    ),
                    PersonalSummaryPage(
                      dataViewModel: getIt(),
                    ),
                    WorkExperiencePage(
                      dataViewModel: getIt(),
                    ),
                    AcademicPage(
                      dataViewModel: getIt(),
                    ),
                    PersonalProjectPage(
                      dataViewModel: getIt(),
                      personalProjectViewModel: getIt(),
                    ),
                    SocialLinksPage(
                      dataViewModel: getIt(),
                      socialLinksViewModel: getIt(),
                    ),
                  ],
                ),
              ),
              widget.modalViewModel.modal,
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
                    FontAwesomeIcons.userLarge,
                    color: Colors.teal,
                    size: 22,
                  ),
                  label: "Perfil",
                ),
                BottomNavigationBarItem(
                  backgroundColor: Colors.black87,
                  icon: Icon(
                    FontAwesomeIcons.userAstronaut,
                    color: Colors.teal,
                    size: 22,
                  ),
                  label: "Resumo",
                ),
                BottomNavigationBarItem(
                  backgroundColor: Colors.black87,
                  icon: Icon(
                    FontAwesomeIcons.buildingUser,
                    color: Colors.teal,
                    size: 22,
                  ),
                  label: "Emprego",
                ),
                BottomNavigationBarItem(
                  backgroundColor: Colors.black87,
                  icon: Icon(
                    FontAwesomeIcons.graduationCap,
                    color: Colors.teal,
                    size: 22,
                  ),
                  label: "Educação",
                ),
                BottomNavigationBarItem(
                  backgroundColor: Colors.black87,
                  icon: Icon(
                    FontAwesomeIcons.github,
                    color: Colors.teal,
                    size: 22,
                  ),
                  label: "Projetos",
                ),
                BottomNavigationBarItem(
                  backgroundColor: Colors.black87,
                  icon: Icon(
                    FontAwesomeIcons.linkedinIn,
                    color: Colors.teal,
                    size: 22,
                  ),
                  label: "Redes",
                ),
              ],
            ),
          ),
        ),
      );
}
