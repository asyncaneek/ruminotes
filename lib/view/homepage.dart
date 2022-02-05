import 'package:flutter/material.dart';
import 'package:rumi_notes/data_source/local_strorage.dart';
import 'package:rumi_notes/view/responsive/mobile_body.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  final LocalStorage storage = LocalStorage();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MobileBody(
      storage: widget.storage,
    );
  }
}
