import 'package:flutter/material.dart';

import 'pages/displaynotepage.dart';
import 'pages/editnotepage.dart';
import 'pages/addnotepage.dart';
import 'pages/mynotespage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    WidgetsApp.debugAllowBannerOverride = false;
    return MaterialApp(
      routes: <String, WidgetBuilder> {
      '/mynotespage': (BuildContext context) => const MyNotesPage(),
      '/addnotepage': (BuildContext context) => const AddNotePage(),
      '/displaynotepage': (BuildContext context) => DisplayNotePage(),
      '/editnotepage':(BuildContext context) => EditNotePage(),
      },
      title: 'app tab',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: const MyNotesPage(),
    );
  }
}
