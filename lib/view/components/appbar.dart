import 'package:flutter/material.dart';
import 'package:rumi_notes/view/components/defines.dart';

class RuminoteAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final ValueNotifier<bool> isMenuOpen;
  @override
  final Size preferredSize;

  RuminoteAppBar(this.title, this.isMenuOpen, {Key? key})
      : preferredSize = const Size.fromHeight(appBarPrefferedSize),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Spacer(),
        Text(title),
        const Spacer(),
        _resolveIcon(),
      ],
    ));
  }

  ValueListenableBuilder<bool> _resolveIcon() {
    return ValueListenableBuilder<bool>(
        valueListenable: isMenuOpen,
        builder: (context, value, child) {
          return ImageIcon(
            AssetImage(value
                ? "assets/icons/up_double_arrows.png"
                : "assets/icons/down_double_arrows.png"),
            size: 20,
          );
        });
  }
}
