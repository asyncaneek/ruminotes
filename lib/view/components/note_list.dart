import 'package:flutter/material.dart';
import 'package:rumi_notes/model/note.dart';
import 'package:rumi_notes/model/storage_interface.dart';
import 'package:rumi_notes/view/components/note_card.dart';
import 'package:rumi_notes/view/components/skeleton.dart';

const double defPadding = 16.0;

class CardList extends StatelessWidget {
  final StorageInterface storage;

  const CardList({Key? key, required this.storage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: const EdgeInsets.all(defPadding / 2),
        itemBuilder: (context, index) {
          return AsyncNoteCard(note: storage.getNoteAtIndex(index));
        },
        separatorBuilder: (BuildContext context, i) =>
            const Skeleton(height: defPadding / 2),
        itemCount: storage.getNotesCount());
  }
}

class AsyncNoteCard extends StatelessWidget {
  const AsyncNoteCard({Key? key, required this.note}) : super(key: key);

  final Future<Note?> note;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: FutureBuilder<Note?>(
            future: note,
            initialData: Note(title: "error - no data"),
            builder: (BuildContext context, AsyncSnapshot<Note?> snapshot) {
              if (snapshot.connectionState == ConnectionState.done &&
                  !snapshot.hasError &&
                  snapshot.hasData) {
                return NoteCard(note: snapshot.data);
              } else {
                return const Padding(
                  padding: EdgeInsets.all(defPadding / 2),
                  child: Skeleton(
                    height: 60,
                    opacity: 0.2,
                  ),
                );
              }
            }));
  }
}
