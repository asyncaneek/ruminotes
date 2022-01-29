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
      padding: const EdgeInsets.all(defaultPadding / 2),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Skeleton(height: 20, width: 20, opacity: 0.2),
            ],
          ),
          const Skeleton(height: defaultPadding / 2, opacity: 0),
          Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [Skeleton(height: 20, width: 250, opacity: 0.2)]),
          const Skeleton(height: defaultPadding / 2, opacity: 0),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Skeleton(height: 10, width: 60, opacity: 0.2),
            ],
          )
        ],
      ),
    );
  }
}
