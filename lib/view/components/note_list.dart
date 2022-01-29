import 'package:flutter/material.dart';
import 'package:rumi_notes/model/storage_interface.dart';
import 'package:rumi_notes/view/components/card/card_async.dart';
import 'package:rumi_notes/view/components/defines.dart';
import 'package:rumi_notes/view/components/skeleton.dart';

class CardList extends StatelessWidget {
  final StorageInterface storage;

  const CardList({Key? key, required this.storage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: const EdgeInsets.all(defaultPadding / 2),
        itemBuilder: (context, index) {
          return CardAsync(note: storage.getNoteAtIndex(index));
        },
        separatorBuilder: (BuildContext context, i) =>
            const Skeleton(height: defaultPadding / 2),
        itemCount: storage.getNotesCount());
  }
}
