import 'package:flutter/material.dart';
import 'package:rumi_notes/responsive/mobile_body.dart';
import 'package:rumi_notes/responsive/responsive_layout.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayout(
        mobileBody: const mobile_body(),
        desktopBody: const mobile_body(),
      ),
    );
  }
}
