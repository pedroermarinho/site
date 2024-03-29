import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkWidget extends StatelessWidget {
  final String? text;
  final String url;
  final TextStyle? style;

  const LinkWidget({required this.url, this.text, this.style});

  _launchURL() async {
    if (!await launchUrl(Uri.parse(url))) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) => TextButton(
        onPressed: _launchURL,
        child: Row(
          children: [
            Icon(
              Icons.link,
              color: Colors.grey,
              size: 15,
            ),
            Flexible(
              child: Text(
                text ?? url,
                style: TextStyle(decoration: TextDecoration.underline),
              ),
            ),
          ],
        ),
      );
}
