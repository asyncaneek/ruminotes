import 'package:flutter/material.dart';
import 'package:rumi_notes/view/components/menu/defines.dart';

class BackdropMenu extends StatelessWidget {
  Widget? header;
  bool showHeader;

  BackdropMenu({Key? key, this.header, this.showHeader = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: Icon(
                  menuItems[menuItems.keys.elementAt(index)],
                  size: 20,
                ),
                title: Text(menuItems.keys.elementAt(index)),
                onTap: () {},
              );
            },
            itemCount: menuItems.length,
          ),
        ),
        showHeader ? header ?? Container() : Container(),
      ],
    );
  }
}
