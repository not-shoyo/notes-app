import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      // backgroundColor: Colors.lightBlue[300],
      backgroundColor: Colors.white12,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Notes"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: Note.numberOfNotes * 2, 
        itemBuilder: (context, i) {
          if (i.isOdd){
            return const Divider(thickness: 5.0,);
          }
          print("creating list tile");
          return ListTile(
            leading: Padding(
              padding: const EdgeInsets.symmetric(vertical: 17.0, horizontal: 15.0),
              child: Text(MyNotes.notes[i~/2].noteNumber.toString()),
            ),
            title: Text(MyNotes.notes[i~/2].noteName),
            subtitle: Text(MyNotes.notes[i~/2].noteContent.substring(0, (MyNotes.notes[i~/2].noteContent.length > 10) ? 10 : MyNotes.notes[i~/2].noteContent.length) + "..."),
            // hoverColor: Colors.lightBlue[500],
            hoverColor: Colors.grey[200],
            onTap: (){
              print("List tile tapped");
            },
          );
        }
      ),
      floatingActionButton:IconButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, "/addnotespage");
        },
        icon: const Icon(Icons.note_add),
        tooltip: "Add Note",
        )
    );
  }
}