import 'package:flutter/material.dart';
import 'package:rumi_notes/view/components/defines.dart';
import 'package:rumi_notes/view/components/skeleton.dart';

class CardCreateNew extends StatefulWidget {
  const CardCreateNew({
    Key? key,
  }) : super(key: key);

  @override
  State<CardCreateNew> createState() => _CardCreateNewState();
}

class _CardCreateNewState extends State<CardCreateNew> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(defaultCornerRadius),
          ),
          color: Theme.of(context).primaryColor),
      margin: const EdgeInsets.all(defaultPadding),
      child: Column(
        children: [
          const Skeleton(
            height: 8,
            opacity: 0,
          ),
          Container(
            width: 300,
            height: 4,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(defaultCornerRadius),
              ),
            ),
          ),
          const Skeleton(
            height: 8,
            opacity: 0,
          ),
          Row(
            children: const [
              Spacer(),
              Text(
                "N E W  N O T E",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              SizedBox(width: 10),
              Icon(
                Icons.add_box_rounded,
                color: Colors.white,
              ),
              Spacer(),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
