import 'package:rumi_notes/model/note_id.dart';
import 'package:rumi_notes/model/note.dart';
import 'package:rumi_notes/model/storage_interface.dart';

class LocalStorage extends StorageInterface {
  List<Note> notes = [];

  LocalStorage() {
    int i = 0;
    notes.add(Note(id: NoteId(i), title: "Title $i"));
    notes.add(Note(
        id: NoteId(i),
        title: "REALLY really really really really really long Title $i",
        text: "Short Note $i")); // no body text
    notes.add(Note(
        id: NoteId(i),
        title: "Title $i",
        text:
            "This is a really long note to test mlti line text on a card and proper resizing of the card $i"));
    notes.add(Note(
        id: NoteId(i),
        title: "Title $i",
        text:
            "This is a really long note to test mlti This is a really long note to test mlti This is a really long note to test mlti This is a really long note to test mlti This is a really long note to test mlti This is a really long note to test mlti line text on a card and proper resizing of the card $i"));
  }

  @override
  int getNotesCount() {
    return notes.length;
  }

  @override
  Future<Note?> getNoteAtIndex(int index) async {
    await Future.delayed(const Duration(milliseconds: 1000));
    if (index < notes.length && index >= 0) {
      return notes.elementAt(index);
    }
  }
}
