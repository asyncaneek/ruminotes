import 'package:flutter/material.dart';
import 'package:rumi_notes/view/components/colors.dart' as col;

class card extends StatelessWidget {
  const card({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
            color: col.background_color_card,
            borderRadius: BorderRadius.all(Radius.circular(15))),
        // decoration: col.card_decoration,
        child: build_body(context, "Card"));
  }

  Widget build_body(BuildContext context, String title) {
    return SizedBox(height: 80, child: Center(child: Text(title)));
  }
}
