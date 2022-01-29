import 'package:flutter/material.dart';
import 'package:rumi_notes/view/components/defines.dart';

class CardTitle extends StatelessWidget {
  const CardTitle({
    Key? key,
    required this.titleStr,
  }) : super(key: key);

  final String titleStr;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(right: defaultPadding, left: defaultPadding),
      child: Text(
        titleStr,
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
}
