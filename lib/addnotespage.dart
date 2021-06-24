import 'package:flutter/material.dart';
import 'package:flutter_application_2/model/note.dart';
import 'package:flutter_application_2/mynotes.dart';
import 'package:simple_text_field/simple_text_field.dart';

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
        automaticallyImplyLeading: false,
        title: ListTile(
          leading: IconButton(
            tooltip: "Notes Page",
            icon: const Icon(Icons.notes, color: Colors.white,),
            onPressed: _backButtonClicked,
            ),
          trailing: IconButton(
            tooltip: "Save",
            icon: const Icon(Icons.save, color: Colors.white),
            onPressed: _saveClicked,
            ),
          title: TextField(
            decoration: const InputDecoration(                        //making the hint and input come in the middle
              hintText: "title",
              hintStyle: TextStyle(
                color: Colors.white60,
              ),
              enabledBorder: InputBorder.none,
            ),
            controller: _titleController,
            cursorColor: Colors.white,
            style: const TextStyle(color: Colors.white),
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
        ),
      ),
    );
  }

  void _saveClicked(){
    if (MyNotes.notes.isNotEmpty){
      int n = MyNotes.notes.length;
      MyNotes.notes.add(Note("note $n"));
    }
    else{
      MyNotes.notes.add(Note("note 1"));
    }
    MyNotes.notes.last.setNoteContent(_noteController.text);
    Navigator.pop(context);
  }

  void _backButtonClicked(){
    Navigator.pop(context);
  }
}