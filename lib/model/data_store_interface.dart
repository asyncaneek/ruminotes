import 'package:rumi_notes/model/note.dart';

abstract class IDataStore {
  int getNotesCount();
  Future<Note?> getNoteAtIndex(int index);
}
