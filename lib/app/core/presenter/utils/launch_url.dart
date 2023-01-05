import 'package:url_launcher/url_launcher.dart';

Future<void> launchURL(String? url) async {
  print(url);
  if (url == null) {
    return;
  }
  if (!await launchUrl(Uri.parse(url))) {
    throw 'Could not launch $url';
  }
}
