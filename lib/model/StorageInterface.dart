import 'package:rumi_notes/model/Note.dart';

abstract class StorageInterface {
  int getNotesCount();
  Note? getNoteAtIndex(int index);
}
