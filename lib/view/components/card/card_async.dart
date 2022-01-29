import 'package:flutter/material.dart';
import 'package:rumi_notes/model/note.dart';
import 'package:rumi_notes/view/components/card/card_skeleton.dart';
import 'package:rumi_notes/view/components/note_card.dart';

class CardAsync extends StatelessWidget {
  const CardAsync({Key? key, required this.note}) : super(key: key);

  final Future<Note?> note;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: FutureBuilder<Note?>(
            future: note,
            initialData: Note(title: ""),
            builder: (BuildContext context, AsyncSnapshot<Note?> snapshot) {
              if (snapshot.connectionState == ConnectionState.done &&
                  !snapshot.hasError &&
                  snapshot.hasData) {
                return NoteCard(note: snapshot.data);
              } else {
                return const CardSkeleton();
              }
            }));
  }
}
