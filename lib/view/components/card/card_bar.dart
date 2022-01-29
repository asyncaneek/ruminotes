import 'package:flutter/material.dart';
import 'package:rumi_notes/view/components/colors.dart';
import 'package:rumi_notes/view/components/defines.dart';
import 'package:rumi_notes/view/components/skeleton.dart';

class CardBar extends StatelessWidget {
  final String? timeStr;
  final bool isExpanded;
  final bool showDropDown;

  const CardBar(
      {Key? key,
      required this.timeStr,
      required this.isExpanded,
      this.showDropDown = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (showDropDown) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(timeStr ?? "", style: const TextStyle(fontSize: 12)),
          Icon(
            isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
            size: 30.0,
            color: accentColor,
          ),
        ],
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Skeleton(height: defaultPadding / 2, opacity: 0),
        Text(timeStr ?? "", style: const TextStyle(fontSize: 12)),
        const Skeleton(height: defaultPadding / 2, opacity: 0),
      ],
    );
  }
}
