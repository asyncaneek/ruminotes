import 'note_id.dart';

class Note {
  NoteId? id;
  String? title = "Title";
  String? text = "New Note";
  DateTime time = DateTime.now();

  Note({this.id, this.title, this.text});
}
