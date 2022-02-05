import 'package:rumi_notes/model/note.dart';

abstract class StorageInterface {
  int get count;
  Future<Note?> getNoteAtIndex(int index);
}
