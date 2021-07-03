import 'package:flutter/material.dart';

import 'mynotespage.dart';

class DisplayNotePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: ListTile(
          leading: TextButton.icon(
            onPressed: (){
              Navigator.pushReplacementNamed(context, "/mynotespage");
            }, 
            icon: const Icon(Icons.notes, color: Colors.blue,), 
            label: const Text("Back to Notes"),
          ),
          trailing: TextButton.icon(
            onPressed: (){
              Navigator.pushReplacementNamed(context, "/editnotepage");
            }, 
            icon: const Icon(Icons.mode_edit_outlined, color: Colors.blue,), 
            label: const Text("Edit Note"),
          ),
        ),
        bottomOpacity: 0.0,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        child: Text(
          (MyNotesPage.noteToDisplay.hasTitle() ? MyNotesPage.noteToDisplay.noteName : "") + "\n\n" + (MyNotesPage.noteToDisplay.hasContent() ? MyNotesPage.noteToDisplay.noteContent : ""),
          textAlign: TextAlign.left,
          ),
        ),
    );
  }
}