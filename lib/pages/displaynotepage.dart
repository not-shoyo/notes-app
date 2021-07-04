import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

// ignore: use_key_in_widget_constructors
// ignore: must_be_immutable
class DisplayNotePage extends StatelessWidget {

  late int n;

  var notesBox = Hive.box('notes');

  // ignore: use_key_in_widget_constructors
  DisplayNotePage(this.n, {Key? key});

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
          (notesBox.get(n).hasTitle() ? notesBox.get(n).noteName : "") + "\n\n" + (notesBox.get(n).hasContent() ? notesBox.get(n).noteContent : ""),
          textAlign: TextAlign.left,
          ),
        ),
    );
  }
}