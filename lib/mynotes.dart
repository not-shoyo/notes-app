import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/addnotespage.dart';
import 'package:flutter_application_2/makelist.dart';
import 'package:flutter_application_2/model/note.dart';

class MyNotes extends StatefulWidget {

  static List<Note> notes = [];

  const MyNotes({ Key? key }) : super(key: key);

  @override
  _MyNotesState createState() => _MyNotesState();
}

class _MyNotesState extends State<MyNotes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("notes with numbers"),
      ),
      body: MakeList(),
      floatingActionButton:IconButton(
        tooltip: "Add Note",
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddNotesPage()));
        },
        icon: const Icon(Icons.note_add)
        )
    );
  }
}