import 'package:flutter/material.dart';
import 'package:rumi_notes/model/storage_interface.dart';
import 'package:rumi_notes/view/components/defines.dart';
import 'package:rumi_notes/view/components/appbar.dart';
import 'package:rumi_notes/view/components/menu/backdrop_menu.dart';
import 'package:rumi_notes/view/components/menu/defines.dart';
import 'package:rumi_notes/view/components/note_list.dart';
import 'package:rumi_notes/view/components/skeleton.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class MobileBody extends StatefulWidget {
  final StorageInterface storage;

  const MobileBody({
    Key? key,
    required this.storage,
  }) : super(key: key);

  @override
  State<MobileBody> createState() => _MobileBodyState();
}

class _MobileBodyState extends State<MobileBody> {
  bool _menuShowing = false;

  Widget _resolveIcon(BuildContext context, bool isOpen) {
    return ImageIcon(
      AssetImage(isOpen
          ? "assets/icons/up_double_arrows.png"
          : "assets/icons/down_double_arrows.png"),
      size: 24,
      color: Theme.of(context).iconTheme.color,
    );
  }

  void _setMenuShowing(bool showing) {
    setState(() {
      _menuShowing = showing;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      slideDirection: SlideDirection.DOWN,
      backdropEnabled: true,
      minHeight: appBarPrefferedSize,
      // maxHeight: (menuItems.length + 1) * 50,
      panel: Container(
          color: Theme.of(context).primaryColor.withOpacity(0.7),
          child: BackdropMenu(
            header: _buildHeader(context, _menuShowing),
            showHeader: _menuShowing,
          )),
      collapsed: _buildHeader(context, _menuShowing),
      body: Container(
        color: Theme.of(context).backgroundColor,
        child: Padding(
          padding: const EdgeInsets.only(top: appBarPrefferedSize),
          child: CardList(storage: widget.storage),
        ),
      ),
      parallaxEnabled: true,
      parallaxOffset: 1.0,
      backdropTapClosesPanel: true,
      onPanelOpened: () => _setMenuShowing(true),
      onPanelClosed: () => _setMenuShowing(false),
    );
  }

  Widget _buildHeader(BuildContext context, bool open) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Spacer(),
          const RuminoteAppBar(
            title: appName,
          ),
          const Spacer(),
          _resolveIcon(context, open),
        ],
      ),
    );
  }
}
