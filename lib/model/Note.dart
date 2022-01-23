import 'NoteId.dart';

class Note {
  NoteId? id;
  String body = "New Note";
  DateTime time = DateTime.now();

  Note({this.id, required this.body});
}
