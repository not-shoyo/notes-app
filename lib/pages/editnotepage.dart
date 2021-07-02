import 'package:flutter/material.dart';

import 'mynotespage.dart';

class EditNotePage extends StatelessWidget {

  TextEditingController _editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: TextButton.icon(
          onPressed: (){
            Navigator.pushReplacementNamed(context, "/displaynotepage");
          }, 
          icon: const Icon(Icons.note_rounded, color: Colors.black,), 
          label: const Text("View Original Note", style: TextStyle(color: Colors.black),),
        ),
        bottomOpacity: 0.0,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        child: TextField(                                                                         //set the prexisting text as the text
          MyNotesPage.noteToDisplay.noteName + "\n\n" + MyNotesPage.noteToDisplay.noteContent,
          textAlign: TextAlign.left,
          ),
        ),
    );
  }
}