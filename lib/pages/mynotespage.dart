import 'package:flutter/material.dart';
import 'package:flutter_application_2/model/note.dart';

class MyNotesPage extends StatefulWidget {

  static Set<Note> notes = {};
  static Note noteToDisplay = Note("");

  const MyNotesPage({ Key? key }) : super(key: key);

  @override
  _MyNotesPageState createState() => _MyNotesPageState();
}

class _MyNotesPageState extends State<MyNotesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              child: Text(MyNotesPage.notes.elementAt(i~/2).noteNumber.toString()),
            ),
            title: Text(MyNotesPage.notes.elementAt(i~/2).hasTitle() ? MyNotesPage.notes.elementAt(i~/2).noteName : "New Note"),
            subtitle: Text(MyNotesPage.notes.elementAt(i~/2).hasContent() ? MyNotesPage.notes.elementAt(i~/2).noteContent.substring(0, (MyNotesPage.notes.elementAt(i~/2).noteContent.length > 10) ? 10 : MyNotesPage.notes.elementAt(i~/2).noteContent.length) + "..." : "No Content"),
            hoverColor: Colors.grey[200],
            onTap: (){
              print("List tile tapped");
              MyNotesPage.noteToDisplay = MyNotesPage.notes.elementAt(i~/2);
              Navigator.pushReplacementNamed(context, "/displaynotepage");
            },
          );
        }
      ),
      floatingActionButton:IconButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, "/addnotepage");
        },
        icon: const Icon(Icons.note_add),
        tooltip: "Add Note",
        )
    );
  }
}