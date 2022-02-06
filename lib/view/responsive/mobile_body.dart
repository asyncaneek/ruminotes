import 'package:flutter/material.dart';
import 'package:rumi_notes/model/data_store_interface.dart';
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

  Widget _floatingCollapsed() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.0), topRight: Radius.circular(24.0)),
      ),
      margin: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0),
      child: const Center(
        child: Text(
          "This is the collapsed Widget",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _floatingPanel() {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(24.0)),
          boxShadow: [
            BoxShadow(
              blurRadius: 20.0,
              color: Colors.grey,
            ),
          ]),
      margin: const EdgeInsets.all(24.0 + 1),
      child: const Center(
        child: Text("This is the SlidingUpPanel when open"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColorApp,
      appBar: RuminoteAppBar(appName, isMenuOpen),
      body: SlidingUpPanel(
        panel: _floatingPanel(),
        collapsed: _floatingCollapsed(),
        body: CardList(storage: storage),
        backdropEnabled: true,
        renderPanelSheet: false,
      ),
    );
  }
}
