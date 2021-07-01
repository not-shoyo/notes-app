import 'package:flutter/material.dart';
import 'package:flutter_application_2/model/note.dart';

import 'mynotes.dart';

/*Making an addnotespage where user will write their note
* once they finish we will set it to the content of that note in notes[i]
* need to change lots of stuff here because copied from internet of how to get input*/

class AddNotesPage extends StatefulWidget {

  const AddNotesPage({Key? key}) : super(key: key);

  @override
  State<AddNotesPage> createState() => _AddNotesPageState();
}

/// This is the private State class that goes with AddNotesPage.
class _AddNotesPageState extends State<AddNotesPage> {
  final TextEditingController _noteController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();

  @override
  void dispose() {
    _noteController.dispose();
    _titleController.dispose();
    super.dispose();
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
              Navigator.pushReplacementNamed(context, "/mynotes");
            },
          ),
          trailing: IconButton(
            tooltip: "Save",
            icon: const Icon(Icons.save, color: Colors.black),
            onPressed: _saveClicked,
            ),
          title: TextField(
            textAlign: TextAlign.center,
            decoration: const InputDecoration(                        //making the hint and input come in the middle
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

  void _saveClicked(){
    if (_noteController.text != "" && _titleController.text != ""){
      MyNotes.notes.add(Note(_titleController.text));
      MyNotes.notes.last.setNoteContent(_noteController.text);
      Navigator.pushReplacementNamed(context, "/mynotes");
    }
    else {
      print("Empty Fields");
    }
  }
}