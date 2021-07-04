import 'package:flutter/material.dart';
import 'package:flutter_application_2/model/Note.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_flutter/adapters.dart';


class MyNotesPage extends StatelessWidget {
  const MyNotesPage({ Key? key }) : super(key: key);

  static var notesBox = Hive.box('notes');

  static List<Note> notes = [];

  static int n = 0;

  static void initState(){
    if (notesBox.isNotEmpty){
      for (int i = 0; i < notesBox.length; ++i){
        if (i >= notes.length){
          notes.add(notesBox.getAt(notesBox.length - 1 - i));
        }
        else{
          notes[i] = notesBox.getAt(notesBox.length - 1 - i);
        }
      }
    }
  }
  
  @override
  Widget build(BuildContext context) {
    initState();
    return Scaffold(
      backgroundColor: Colors.white12,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Notes"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: notes.length * 2, 
        itemBuilder: (context, i) {
          if (i.isOdd){
            return const Divider(thickness: 5.0,);
          }
          print("creating list tile");
          return ListTile(
            leading: Padding(
              padding: const EdgeInsets.symmetric(vertical: 17.0, horizontal: 15.0),
              child: Text(((i~/2) + 1).toString()),
            ),
            title: Text(notes[i~/2].hasTitle() ? notes[i~/2].noteName : "New Note"),
            subtitle: Text(notes[i~/2].hasContent() ? notes[i~/2].noteContent.substring(0, (notes[i~/2].noteContent.length > 10) ? 10 : notes[i~/2].noteContent.length) + "..." : "No Content"),
            hoverColor: Colors.grey[200],
            onTap: (){
              print("List tile tapped");
              n = notes[i~/2].noteNumber;
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