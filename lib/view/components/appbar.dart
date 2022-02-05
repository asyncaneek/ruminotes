import 'package:flutter/material.dart';
import 'package:rumi_notes/view/components/defines.dart';
import 'package:rumi_notes/view/components/menu/backdrop_menu.dart';
import 'package:rumi_notes/view/components/menu/defines.dart';
import 'package:rumi_notes/view/components/skeleton.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class RuminoteAppBar extends StatelessWidget {
  final String title;

  const RuminoteAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: appBarPrefferedSize,
      child: Center(
        child: Text(
          appName,
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}
