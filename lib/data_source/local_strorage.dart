import 'package:rumi_notes/model/note_id.dart';
import 'package:rumi_notes/model/note.dart';
import 'package:rumi_notes/model/data_store_interface.dart';

class LocalStorage extends IDataStore {
  List<Note> notes = [];

  LocalStorage() {
    for (var v = 1; v < 50; v += 2) {
      notes.add(
        Note(
          id: NoteId(v),
          title: "Haircut",
          text: "Case Cuts Barbershop",
          time: DateTime(2021, 11, v),
        ),
      );
    }
  }

  @override
  Future<Note?> getNoteAtIndex(int index) async {
    await Future.delayed(const Duration(milliseconds: 500));
    if (index < notes.length && index >= 0) {
      return notes.elementAt(index);
    }
    return null;
  }

  @override
  int get count => notes.length;
}
