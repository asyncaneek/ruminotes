import 'package:flutter/material.dart';
import 'package:rumi_notes/view/components/colors.dart' as col;

class card extends StatelessWidget {
  const card({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: col.card_decoration,
        child: ExpansionTile(
          backgroundColor: col.background_color_card,
          title: Text("TEST_TITLE"),
          children: <Widget>[
            Container(
                decoration: col.card_decoration, child: Text("Description 1"))
          ],
        ));
  }
}
