import 'package:rumi_notes/model/note.dart';

abstract class StorageInterface {
  int getNotesCount();
  Future<Note?> getNoteAtIndex(int index);
}
