import 'package:flutter/material.dart';
import 'package:rumi_notes/view/components/defines.dart';
import 'package:rumi_notes/view/components/skeleton.dart';

class CardSkeleton extends StatelessWidget {
  const CardSkeleton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: defaultPadding,
          right: defaultPadding / 2,
          top: defaultPadding / 2,
          bottom: defaultPadding / 2),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Skeleton(height: 15, width: 75, opacity: 0.2),
              Skeleton(height: 15, width: 15, opacity: 0.2),
            ],
          ),
          const Skeleton(height: defaultPadding / 2, opacity: 0),
          Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [Skeleton(height: 40, width: 200, opacity: 0.2)]),
          const Skeleton(height: defaultPadding / 4, opacity: 0)
        ],
      ),
    );
  }
}
