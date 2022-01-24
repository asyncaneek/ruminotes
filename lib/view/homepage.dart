import 'package:flutter/material.dart';
import 'package:rumi_notes/data_source/local_strorage.dart';
import 'package:rumi_notes/view/responsive/mobile_body.dart';
import 'package:rumi_notes/view/responsive/responsive_layout.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final LocalStorage storage = LocalStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayout(
        mobileBody: MobileBody(storage: storage),
        desktopBody: MobileBody(storage: storage),
      ),
    );
  }
}
