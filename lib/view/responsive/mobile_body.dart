import 'package:flutter/material.dart';
import 'package:rumi_notes/model/data_store_interface.dart';
import 'package:rumi_notes/view/components/card/card_create_new.dart';
import 'package:rumi_notes/view/components/colors.dart';
import 'package:rumi_notes/view/components/defines.dart';
import 'package:rumi_notes/view/components/appbar.dart';
import 'package:rumi_notes/view/components/note_list.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class MobileBody extends StatelessWidget {
  final ValueNotifier<bool> isMenuOpen;

  const MobileBody({Key? key, required this.storage, required this.isMenuOpen})
      : super(key: key);

  final IDataStore storage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColorApp,
      appBar: RuminoteAppBar(appName, isMenuOpen),
      body: SlidingUpPanel(
        panel: const CardCreateNew(),
        body: CardList(storage: storage),
        backdropEnabled: true,
        renderPanelSheet: false,
        minHeight: 70,
        maxHeight: 420,
      ),
    );
  }
}
