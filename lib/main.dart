import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'model/Note.dart';
import 'pages/displaynotepage.dart';
import 'pages/editnotepage.dart';
import 'pages/addnotepage.dart';
import 'pages/mynotespage.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NoteAdapter());
  await Hive.openBox('notes');
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
      '/addnotepage': (BuildContext context) => AddNotePage(),
      '/displaynotepage': (BuildContext context) => DisplayNotePage(MyNotesPage.n),
      '/editnotepage':(BuildContext context) => EditNotePage(MyNotesPage.n),
      },
      title: 'app tab',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: const MyNotesPage(),
    );
  }
}
