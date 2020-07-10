import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:site/app/components/layout_custom/layout_custom_widget.dart';
import 'package:site/app/components/line/line_widget.dart';
import 'package:site/app/components/link/link_widget.dart';
import 'package:site/app/components/skills/skills_widget.dart';
import 'package:site/app/components/text_icon/text_icon_widget.dart';

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
            child: Container(
              height: double.infinity,
              width: 430,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: ListView(
                children: [
                  Container(
                      height: 300,
//                  color: Colors.deepOrange,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter,
                          image: NetworkImage(
                            "https://avatars1.githubusercontent.com/u/29618874?s=460&u=79e9fc05c1107e81d0c038fab53e5132f147e40e&v=4",
                          ),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              "Pedro Marinho",
                              style:
                                  TextStyle(fontSize: 30, color: Colors.white),
                            ),
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.5)),
                            padding: EdgeInsets.all(4),
                          )
                        ],
                      )),
                  Container(
                    padding: EdgeInsets.only(
                      left: 15,
                      top: 15,
                      bottom: 20,
                    ),
                    child: Column(
                      children: [
                        TextIconWidget(
                          text: "Desenvolvedor",
                          icon: Icons.business_center,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextIconWidget(
                          text: "Manauas-AM",
                          icon: Icons.home,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextIconWidget(
                          text: "pedro.marinho238@gmail.com",
                          icon: Icons.email,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextIconWidget(
                          text: "+55 97 991389183",
                          icon: Icons.phone,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ],
                    ),
                  ),
                  LineWidget(),
                  Container(
//                  color: Colors.amber,
                    padding: EdgeInsets.only(
                      left: 15,
                      top: 15,
                      bottom: 20,
                    ),
                    child: Column(
                      children: [
                        TextIconWidget(
                          text: "Habilidades",
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          child: Wrap(
                            direction: Axis.horizontal,
                            spacing: 5,
                            runSpacing: 5,
                            children: [
                              SkillsWidget(text: "Básico", nivel: 1),
                              SkillsWidget(text: "Intermediário", nivel: 2),
                              SkillsWidget(text: "Avançado", nivel: 3),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Wrap(
                          alignment: WrapAlignment.start,
                          direction: Axis.horizontal,
                          spacing: 10,
                          runSpacing: 10,
                          children: [
                            SkillsWidget(text: "Java", nivel: 2),
                            SkillsWidget(text: "JavaFX", nivel: 2),
                            SkillsWidget(text: "Python", nivel: 2),
                            SkillsWidget(text: "C/C++", nivel: 1),
                            SkillsWidget(text: "Mysql", nivel: 1),
                            SkillsWidget(text: "Linux", nivel: 2),
                            SkillsWidget(text: "Rust", nivel: 1),
                            SkillsWidget(text: "Flutter", nivel: 2),
                            SkillsWidget(text: "Bash", nivel: 1),
                            SkillsWidget(text: "Git/Github", nivel: 2),
                            SkillsWidget(text: "PHP", nivel: 1),
                            SkillsWidget(text: "HTML", nivel: 1),
                            SkillsWidget(text: "Javascript", nivel: 1),
                            SkillsWidget(text: "Windows", nivel: 2),
                          ],
                        )
                      ],
                    ),
                  ),
                  LineWidget(),
                  Container(
                    padding: EdgeInsets.only(
                      left: 15,
                      top: 15,
                      bottom: 20,
                    ),
                    child: Column(
                      children: [
                        TextIconWidget(
                          text: "Línguas",
                          icon: Icons.language,
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          child: Wrap(
                            direction: Axis.horizontal,
                            spacing: 5,
                            runSpacing: 5,
                            children: [
                              SkillsWidget(text: "Básico", nivel: 1),
                              SkillsWidget(text: "Intermediário", nivel: 2),
                              SkillsWidget(text: "Avançado", nivel: 3),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Wrap(
                          alignment: WrapAlignment.start,
                          direction: Axis.horizontal,
                          spacing: 10,
                          runSpacing: 10,
                          children: [
                            SkillsWidget(text: "Português", nivel: 3),
                            SkillsWidget(text: "Espanhol", nivel: 1),
                            SkillsWidget(text: "Inglês", nivel: 1),
                          ],
                        )
                      ],
                    ),
                  ),
                  LineWidget(),
                  Container(
                    padding: EdgeInsets.only(
                      left: 15,
                      top: 15,
                      bottom: 20,
                    ),
                    child: Column(
                      children: [
                        TextIconWidget(
                          text: "Links Relacionados",
                          icon: Icons.link,
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        LinkWidget(url: "https://www.diolinux.com.br/2019/09/photogimp-snapcraft-snap-ubuntu-gimp-photoshop-editor-imagem-linux.html",
                        text: "PhotoGIMP agora está disponível em Snap",)
                      ],
                    )
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Expanded(
            child: Container(
              height: double.infinity,
              child: ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.all(6),
                    child: Container(
                      height: 250,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(6),
                    child: Container(
                      height: 340,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(6),
                    child: Container(
                      height: 1000,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
