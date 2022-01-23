import 'package:rumi_notes/model/NoteId.dart';
import 'package:rumi_notes/model/Note.dart';
import 'package:rumi_notes/model/StorageInterface.dart';

class LocalStorage extends StorageInterface {
  List<Note> notes = [];

  LocalStorage() {
    for (var i = 0; i < 20; i++) {
      notes.add(Note(id: NoteId(i), body: "Testing #$i"));
    }
  }

  @override
  int getNotesCount() {
    return notes.length;
  }

  @override
  Note? getNoteAtIndex(int index)
  // async
  {
    // await Future.delayed(const Duration(seconds: 2));
    if (index < notes.length && index >= 0) {
      return notes.elementAt(index);
    }
  }
}
