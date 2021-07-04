import 'package:flutter/material.dart';
import 'package:flutter_application_2/model/Note.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_flutter/adapters.dart';

// ignore: must_be_immutable
class AddNotePage extends StatelessWidget {
  AddNotePage({ Key? key }) : super(key: key);

  var notesBox = Hive.box('notes');

  final TextEditingController _noteController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();

  void dispose() {
    _noteController.dispose();
    _titleController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: ListTile(
          dense: false,
          leading: IconButton(
            tooltip: "Notes Page",
            icon: const Icon(Icons.notes, color: Colors.black,),
            onPressed: () {
              Navigator.pushReplacementNamed(context, "/mynotespage");
            },
          ),
          trailing: IconButton(
            tooltip: "Save",
            icon: const Icon(Icons.save, color: Colors.black),
            onPressed: () {_saveClicked(context);},
            ),
          title: TextField(
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              hintText: "title",
              hintStyle: TextStyle(
                color: Colors.black54,
              ),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
            controller: _titleController,
            cursorColor: Colors.black,
            style: const TextStyle(color: Colors.black),
            maxLines: 1,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          maxLines: null,
          minLines: null,
          expands: true,
          controller: _noteController,
          decoration: const InputDecoration(
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
          ),
        ),
      ),
    );
  }

  void _saveClicked(BuildContext context){
    if (_noteController.text == "" && _titleController.text == ""){
      showDialog(
        context: context, 
        builder: (BuildContext context) {
          bool manuallyClosed = false;
          Future.delayed(const Duration(seconds: 1)).then((_) {
            if (!manuallyClosed) {
              Navigator.of(context).pop();
            }
          });
          return const AlertDialog(
            title: Center(
              child: Text("Cannot save a note with no name and no content"),
            ),
          );
        }
      );
    }
    else {
      Note temp = Note(_titleController.text, _noteController.text);
      notesBox.put(temp.noteNumber,temp);
      // MyNotesPage.notes.add(Note(_titleController.text));
      // MyNotesPage.notes.last.setNoteContent(_noteController.text);
      Navigator.pushReplacementNamed(context, "/mynotespage");
    }
  }
}