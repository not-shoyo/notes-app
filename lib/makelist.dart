import 'package:flutter/material.dart';
import 'package:flutter_application_2/mynotes.dart';
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
    if (MyNotes.notes.isEmpty){
      return Container();
    }
    else{
      return ListView.builder(
        itemCount: MyNotes.notes.length,
        itemBuilder: (context, i){
          if (i.isOdd){
            return const Divider(thickness: 2.0,);
          }
          else if (i < MyNotes.notes.length){
            return ListTile(
                leading: Text(MyNotes.notes[i~/2].noteNumber.toString()),
                title: Text(MyNotes.notes[i~/2].noteName),
                subtitle: Text(MyNotes.notes[i~/2].noteName.substring(0, 10) + "..."),
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