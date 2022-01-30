import 'package:flutter/material.dart';
import 'package:rumi_notes/model/storage_interface.dart';
import 'package:rumi_notes/view/components/colors.dart';
import 'package:rumi_notes/view/components/defines.dart';
import 'package:rumi_notes/view/components/appbar.dart';
import 'package:rumi_notes/view/components/note_list.dart';

class MobileBody extends StatelessWidget {
  ValueNotifier<bool> isMenuOpen = ValueNotifier(false);

  MobileBody({Key? key, required this.storage, required this.isMenuOpen})
      : super(key: key);

  final StorageInterface storage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColorApp,
        appBar: RuminoteAppBar(appName, isMenuOpen),
        body: CardList(storage: storage));
  }
}
