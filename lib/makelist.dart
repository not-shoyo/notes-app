import 'package:flutter/material.dart';

import 'pages/mynotespage.dart';
/*
  Not in use rn, copied important part to MyNotes
  Not in use rn, copied important part to MyNotes
  Not in use rn, copied important part to MyNotes
  Not in use rn, copied important part to MyNotes
  Not in use rn, copied important part to MyNotes
  Not in use rn, copied important part to MyNotes
  Not in use rn, copied important part to MyNotes
  Not in use rn, copied important part to MyNotes
  Not in use rn, copied important part to MyNotes
  Not in use rn, copied important part to MyNotes
  Not in use rn, copied important part to MyNotes
  Not in use rn, copied important part to MyNotes
  Not in use rn, copied important part to MyNotes
*/
class MakeList extends StatelessWidget {
  const MakeList({ Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (MyNotesPage.notes.isEmpty){
      return Container();
    }
    else{
      return ListView.builder(
        itemCount: MyNotesPage.notes.length,
        itemBuilder: (context, i){
          if (i.isOdd){
            return const Divider(thickness: 2.0,);
          }
          else if (i < MyNotesPage.notes.length){
            return ListTile(
                leading: Text(MyNotesPage.notes.elementAt(i~/2).noteNumber.toString()),
                title: Text(MyNotesPage.notes.elementAt(i~/2).noteName),
                subtitle: Text(MyNotesPage.notes.elementAt(i~/2).noteName.substring(0, 10) + "..."),
              );
          }
          else{
            return const Divider(thickness: 2.0,);
          }
        }
      );
    }
  }
}