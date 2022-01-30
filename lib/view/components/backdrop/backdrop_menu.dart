import 'package:flutter/material.dart';

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
      color: Theme.of(context).primaryColor.withOpacity(0.5),
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Text("Item " + index.toString()),
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
