import 'package:flutter/material.dart';
import 'package:rumi_notes/view/components/card.dart';

class card_list extends StatelessWidget {
  const card_list({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 30,
        itemBuilder: (BuildContext context, int index) {
          return const card();
        },
      ),
    );
  }
}
