import 'package:flutter/material.dart';
import 'package:flutter_application_2/model/note.dart';
import 'package:flutter_application_2/mynotes.dart';

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
  late TextEditingController _noteController;

  @override
  void initState() {
    super.initState();
    _noteController = TextEditingController();
  }

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          tooltip: "Notes Page",
          icon: const Icon(Icons.notes, color: Colors.white,),
          onPressed: _backButtonClicked,
          ),
        title: IconButton(
            tooltip: "Save",
            icon: const Icon(Icons.save, color: Colors.white),
            onPressed: _saveClicked,
            )
          ),
      body: Center(
        widthFactor: 50.0,
        child: TextField(
          maxLines: null,
          minLines: null,
          expands: true,
          controller: _noteController,
          onSubmitted: (String value) async {
            await showDialog<void>(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Enter name of note: '),
                  content: const TextField(),
                  actions: <Widget>[
                    TextButton(
                      onPressed: _backButtonClicked,
                      child: const Text('Set Note Name'),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }

  _saveClicked(){
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

  _backButtonClicked(){
    Navigator.pop(context);
  }
}