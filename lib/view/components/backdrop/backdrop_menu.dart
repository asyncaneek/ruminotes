import 'package:flutter/material.dart';
import 'package:rumi_notes/view/components/backdrop/defines.dart';

class BackdropMenu extends StatelessWidget {
  final int selectedItem;
  final ValueChanged<int> onTileTap;
  final int itemCount;

  const BackdropMenu(
      {Key? key,
      required this.selectedItem,
      required this.onTileTap,
      required this.itemCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor.withOpacity(0.7),
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Icon(
              menuItems[menuItems.keys.elementAt(index)],
              size: 20,
            ),
            title: Text(menuItems.keys.elementAt(index)),
            onTap: () {
              onTileTap(index);
            },
          );
        },
        itemCount: itemCount,
      ),
    );
  }
}
