import 'package:rumi_notes/model/note.dart';

abstract class IDataStore {
  int get count;
  Future<Note?> getNoteAtIndex(int index);
}
