import 'package:flutter/material.dart';
import 'package:rumi_notes/data_source/local_strorage.dart';
import 'package:rumi_notes/view/components/menu/backdrop.dart';
import 'package:rumi_notes/view/components/menu/backdrop_menu.dart';
import 'package:rumi_notes/view/components/menu/defines.dart';
import 'package:rumi_notes/view/responsive/mobile_body.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  final ValueNotifier<bool> isMenuOpen = ValueNotifier(false);

  final LocalStorage storage = LocalStorage();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  void onTileTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BackDrop(
      onMenuOpen: widget.isMenuOpen,
      currentIndex: currentIndex,
      backLayer: BackdropMenu(
        selectedItem: currentIndex,
        onTileTap: onTileTap,
        itemCount: menuItems.length,
      ),
      frontLayer: MobileBody(
        storage: widget.storage,
        isMenuOpen: widget.isMenuOpen,
      ),
    );
  }
}
