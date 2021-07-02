import 'package:flutter/material.dart';

import 'mynotespage.dart';

class DisplayNotePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: TextButton.icon(
          onPressed: (){
            Navigator.pushReplacementNamed(context, "/mynotespage");
          }, 
          icon: const Icon(Icons.notes, color: Colors.blue,), 
          label: const Text("Back to notes"),
        ),
        bottomOpacity: 0.0,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        child: Text(
          MyNotesPage.noteToDisplay.noteName + "\n\n" + MyNotesPage.noteToDisplay.noteContent,
          textAlign: TextAlign.left,
          ),
        ),
    );
  }
}