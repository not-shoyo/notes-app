import 'package:flutter/material.dart';
import 'package:flutter_application_2/model/Note.dart';
import 'package:flutter_application_2/pages/mynotespage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

// ignore: must_be_immutable
class EditNotePage extends StatelessWidget {

  late int n;

  var notesBox = Hive.box('notes');

  // ignore: use_key_in_widget_constructors
  EditNotePage(this.n, {Key ? key});

  late TextEditingController _contentEditingController;
  late TextEditingController _titleEditingController;

  void begin(){
    _contentEditingController = TextEditingController(text: notesBox.get(n).hasContent() ? notesBox.get(n).noteContent : "");
    _titleEditingController = TextEditingController(text: notesBox.get(n).hasTitle() ? notesBox.get(n).noteName : "");
  }

  void dispose() {
    _titleEditingController.dispose();
    _contentEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    begin();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: ListTile(
          dense: false,
          leading: IconButton(
            onPressed: (){
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Center(
                      child: Column(
                        children: [
                          const ListTile(
                            title: Center(child: Text("Are you sure you want to go back to original note?")),
                            subtitle: Center(child: Text("(All changes made will be lost)")),
                          ),
                          ListTile(
                            leading: TextButton(
                              onPressed: () {
                                dispose();
                                Navigator.pushReplacementNamed(context, "/displaynotepage", arguments: n);
                              },
                              child: const Text("Yes")
                            ),
                            trailing: TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("No")
                            ),
                          ),
                        ]
                      ),
                    ),
                  );
                }
              );
            }, 
            icon: const Icon(Icons.note_rounded, color: Colors.blue,), 
            tooltip: "View Original Note",
          ),
          title: TextField(
            maxLines: 1,
            cursorColor: Colors.black,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 14, color: Colors.black),
            controller: _titleEditingController,
            decoration: const InputDecoration(
              hintText: "title",
              hintStyle: TextStyle(
                color: Colors.black54,
              ),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ),
          trailing: IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Center(
                      child: Column(
                        children: [
                          const ListTile(
                            title: Center(child: Text("Are you sure you want to Save Changes?")),
                            subtitle: Center(child: Text("(previous version will be lost forever)")),
                          ),
                          ListTile(
                            leading: TextButton(
                              onPressed: () {_saveClicked(context);},
                              child: const Text("Yes")
                            ),
                            trailing: TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("No")
                            ),
                          ),
                        ]
                      ),
                    ),
                  );
                });
            },
            icon: const Icon(Icons.save, color: Colors.blue,),
            tooltip: "Save",
            ),
        ),
        bottomOpacity: 0.0,
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(vertical: 8.5, horizontal:  15.0),
          child: TextField(
            style: const TextStyle(fontSize: 14),
            maxLines: null,
            minLines: null,
            expands: true,
            controller: _contentEditingController,
            decoration: const InputDecoration(
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ),
        ),
    );
  }

  void _saveClicked(BuildContext context){
    if (_contentEditingController.text == "" && _titleEditingController.text == ""){
      showDialog(
        context: context, 
        builder: (BuildContext context) {
          bool manuallyClosed = false;
          Future.delayed(const Duration(seconds: 1)).then((_) {
            if (!manuallyClosed) {
              Navigator.of(context).pop();
            }
          });
          Navigator.pop(context);
          return const AlertDialog(
            title: Center(
              child: Text("Cannot save a note with no name and no content"),
            ),
          );
        }
      );
    }
    else {
      notesBox.delete(notesBox.get(n).noteNumber);
      Note noteToAdd = Note(_titleEditingController.text, _contentEditingController.text);
      notesBox.put(noteToAdd.noteNumber,noteToAdd);
      // notesBox.delete(notesBox.length - 1);
      // MyNotesPage.noteToDisplay = Note(_titleEditingController.text, _contentEditingController.text);
      // notesBox.add(MyNotesPage.noteToDisplay);
      // MyNotesPage.noteToDisplay.setNoteTitle(_titleEditingController.text);
      // MyNotesPage.noteToDisplay.setNoteContent(_contentEditingController.text);
      dispose();
      MyNotesPage.n = noteToAdd.noteNumber;
      Navigator.pushReplacementNamed(context, "/displaynotepage", arguments: n);
    }
  }
}