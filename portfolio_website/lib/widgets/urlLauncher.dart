import 'package:Portfolio/utilities/index.dart';

launchURL(String link) async {
  String url = link;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
