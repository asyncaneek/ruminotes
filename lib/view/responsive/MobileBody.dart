import 'package:flutter/material.dart';
import 'package:rumi_notes/model/StorageInterface.dart';
import 'package:rumi_notes/view/components/colors.dart';
import 'package:rumi_notes/view/components/defines.dart';
import 'package:rumi_notes/view/components/RumiNoteAppBar.dart';
import 'package:rumi_notes/view/components/NoteList.dart';

class MobileBody extends StatelessWidget {
  const MobileBody({Key? key, required this.storage}) : super(key: key);

  final StorageInterface storage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColorApp,
        appBar: RuminoteAppBar(appName),
        body: CardList(storage: storage));
  }
}
