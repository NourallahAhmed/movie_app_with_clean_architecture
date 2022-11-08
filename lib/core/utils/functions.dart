import 'package:url_launcher/url_launcher.dart';

class Functions{
  static  //todo open the url link
   Future<void> launch_Url(_url) async {
    if (!await launchUrl(Uri.parse(_url))) {
      throw 'Could not launch $_url';
    }
  }
}