import 'package:flutter/material.dart';

class app_bar extends StatelessWidget with PreferredSizeWidget {
  final String title;

  @override
  final Size preferredSize;

  app_bar(this.title, {Key? key})
      : preferredSize = const Size.fromHeight(50.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(title: Center(child: Text(title)));
  }
}
