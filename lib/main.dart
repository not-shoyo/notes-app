import 'package:flutter/material.dart';
import 'package:flutter_application_2/addnotespage.dart';

import 'mynotes.dart';

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
      '/a': (BuildContext context) => MyNotes(),
      '/b': (BuildContext context) => AddNotesPage(),
      },
      title: 'app tab',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyNotes(),
    );
  }
}
