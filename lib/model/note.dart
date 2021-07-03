class Note {

  String noteName = "";
  String noteContent = "";
  int noteNumber = 0;
  static int numberOfNotes = 0;

  Note(this.noteName){
    noteNumber = ++numberOfNotes;
    print("Note  number " + noteNumber.toString() + " is created");
  }

  void setNoteTitle(String title){
    noteName = title;
  }

  void setNoteContent(String content){
    noteContent = content;
  }

  bool hasTitle(){
    return this.noteName != "";
  }

  bool hasContent(){
    return this.noteContent != "";
  }
}

