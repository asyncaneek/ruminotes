import 'package:flutter/material.dart';
import 'package:rumi_notes/model/data_store_interface.dart';
import 'package:rumi_notes/view/components/card/card_future.dart';
import 'package:rumi_notes/view/components/defines.dart';
import 'package:rumi_notes/view/components/skeleton.dart';

class CardList extends StatelessWidget {
  final IDataStore storage;

  const CardList({Key? key, required this.storage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(defaultPadding / 2),
      itemBuilder: (context, index) {
        return CardFuture(
          note: storage.getNoteAtIndex(index),
        );
      },
      separatorBuilder: (BuildContext context, i) => const Skeleton(
        height: defaultPadding / 2,
        opacity: 0,
      ),
      itemCount: storage.count,
    );
  }
}
