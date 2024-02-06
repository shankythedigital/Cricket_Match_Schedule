import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Clickable URL Example'),
//         ),
//         body: Center(
//           child: ClickableUrlWidget(),
//         ),
//       ),
//     );
//   }
// }

// ignore: must_be_immutable
class ClickableUrlWidget extends StatelessWidget {
  var url;

  //final String url = 'https://www.example.com';

  ClickableUrlWidget({super.key,  required this.title, required this.description, required this.url});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _launchUrl(),
      child: Text(
        '$title $description $url',
        style: const TextStyle(
          color: Colors.blue,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }

  void _launchUrl() async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
