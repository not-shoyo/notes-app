import 'package:flutter/material.dart';
import 'package:flutter_application_2/model/note.dart';

import 'mynotespage.dart';

class EditNotePage extends StatefulWidget {
  const EditNotePage({ Key? key }) : super(key: key);

  @override
  _EditNotePageState createState() => _EditNotePageState();
}

class _EditNotePageState extends State<EditNotePage> {

  final TextEditingController _contentEditingController = TextEditingController(text: MyNotesPage.noteToDisplay.hasContent() ? MyNotesPage.noteToDisplay.noteContent : "");
  final TextEditingController _titleEditingController = TextEditingController(text: MyNotesPage.noteToDisplay.hasTitle() ? MyNotesPage.noteToDisplay.noteName : "");

  @override
  void dispose() {
    _titleEditingController.dispose();
    _contentEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                                Navigator.pushReplacementNamed(context, "/displaynotepage");
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
                              onPressed: _saveClicked,
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

  void _saveClicked(){
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
      MyNotesPage.noteToDisplay.setNoteTitle(_titleEditingController.text);
      MyNotesPage.noteToDisplay.setNoteContent(_contentEditingController.text);
      Navigator.pushReplacementNamed(context, "/displaynotepage");
    }
  }

}