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
        title: Text(MyNotes.notes.length.toString()),
      ),
      body: ListView.builder(
        itemCount: Note.numberOfNotes * 2, 
        itemBuilder: (context, i) {
          if (i.isOdd){
            return const Divider(thickness: 2.0,);
          }
          print("creating list tile");
          return ListTile(
            leading: Text(MyNotes.notes[i~/2].noteNumber.toString()),
            title: Text(MyNotes.notes[i~/2].noteName),
            subtitle: Text(MyNotes.notes[i~/2].noteContent.substring(0, 10) + "..."),
          );
        }
      ),
      floatingActionButton:IconButton(
        tooltip: "Add Note",
        onPressed: () {
          Navigator.pushNamed(context, '/b');
        },
        icon: const Icon(Icons.note_add)
        )
    );
  }
}