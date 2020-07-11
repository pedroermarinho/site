import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:site/app/components/line/line_widget.dart';
import 'package:site/app/shared/config/constants.dart';
import 'package:url_launcher/url_launcher.dart';

import 'container5_controller.dart';

class Container5Page extends StatefulWidget {
  final String title;

  const Container5Page({Key key, this.title = "Container5"}) : super(key: key);

  @override
  _Container5PageState createState() => _Container5PageState();
}

class _Container5PageState
    extends ModularState<Container5Page, Container5Controller> {
  //use 'controller' variable to access controller

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

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
          child: Wrap(
            direction: Axis.horizontal,
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.center,
            children: [
              IconButton(
                icon: Icon(FontAwesomeIcons.githubSquare),
                onPressed: () => _launchURL(Constants.PROFILE_GITHUB),
                iconSize: 100,
              ),
              IconButton(
                icon: Icon(FontAwesomeIcons.medium),
                onPressed: () => _launchURL(Constants.PROFILE_MEDIUM),
                iconSize: 100,
              ),
              IconButton(
                icon: Icon(FontAwesomeIcons.instagramSquare),
                onPressed: () => _launchURL(Constants.PROFILE_INSTAGRAM),
                iconSize: 100,
              ),
              IconButton(
                icon: Icon(FontAwesomeIcons.linkedin),
                onPressed: () => _launchURL(Constants.PROFILE_LINKEDIN),
                iconSize: 100,
              ),
              IconButton(
                icon: Icon(FontAwesomeIcons.youtubeSquare),
                onPressed: () => _launchURL(Constants.PROFILE_YOUTUBE),
                iconSize: 100,
              ),
              IconButton(
                icon: Icon(FontAwesomeIcons.twitterSquare),
                onPressed: () => _launchURL(Constants.PROFILE_TWITTER),
                iconSize: 100,
              ),
              LineWidget(
                color: Colors.transparent,
              )
            ],
          ),
        ),
      ),
    );
  }
}