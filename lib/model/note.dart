class Note {
  String noteName = "";
  String noteContent = "";
  int noteNumber = 0;
  static int numberOfNotes = 0;

  Note(this.noteName){
    noteNumber = ++numberOfNotes;
  }

  void setNoteContent(String content){
    noteContent = content;
  }
}