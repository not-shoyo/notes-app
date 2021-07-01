import 'package:flutter/material.dart';

import 'pages/addnotespage.dart';
import 'pages/mynotes.dart';

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
      '/mynotes': (BuildContext context) => const MyNotes(),
      '/addnotespage': (BuildContext context) => const AddNotesPage(),
      },
      title: 'app tab',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: const MyNotes(),
    );
  }
}
