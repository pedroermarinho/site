import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:site/app/components/item_information/item_information_widget.dart';
import 'package:site/app/components/line/line_widget.dart';
import 'package:site/app/components/text_icon/text_icon_widget.dart';

import 'container2_controller.dart';

class Container2Page extends StatefulWidget {
  final String title;

  const Container2Page({Key key, this.title = "Container2"}) : super(key: key);

  @override
  _Container2PageState createState() => _Container2PageState();
}

class _Container2PageState
    extends ModularState<Container2Page, Container2Controller> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(6),
      child: Container(
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
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextIconWidget(
                text: "Experiência de Trabalho",
                icon: Icons.business,
                sizeIcon: 40,
                style: Theme.of(context).textTheme.headline1,
              ),
              SizedBox(height: 55),
              ItemInformationWidget(
                titulo: "Sem Experiência Profissional",
                inicio: "Jan 2019",
                descricao:
                    "Objetivo: Primeiro emprego como programador ou outro do ramo da T.I",
              ),
              Padding(
                padding: EdgeInsets.only(top: 15, bottom: 15),
                child: LineWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
