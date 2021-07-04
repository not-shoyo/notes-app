import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'note.g.dart';

@HiveType(typeId: 0)
class Note {

  @HiveField(0)
  String noteName = "";
  @HiveField(1)
  String noteContent = "";
  @HiveField(2)
  int noteNumber = 0;
  static int numberOfNotes = 0;

  Note(this.noteName, this.noteContent){
    noteNumber = ++numberOfNotes;
    // ignore: avoid_print
    print("Note " + noteName + " is created");
  }

  Note setNoteTitle(String title){
    noteName = title;
    return this;
  }

  Note setNoteContent(String content){
    noteContent = content;
    return this;
  }

  bool hasTitle(){
    return noteName != "";
  }

  bool hasContent(){
    return noteContent != "";
  }
}

