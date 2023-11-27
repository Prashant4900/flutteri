import 'package:url_launcher/url_launcher.dart';

Future<void> urlLaunch(String url) async {
  final url0 = Uri.parse(url);

  if (!await launchUrl(url0)) {
    // throw Exception('Could not launch $url0');
  }
}
