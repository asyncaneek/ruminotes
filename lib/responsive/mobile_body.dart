import 'package:flutter/material.dart';
import 'package:rumi_notes/view/components/colors.dart';
import 'package:rumi_notes/view/components/defines.dart';
import 'package:rumi_notes/view/components/app_bar.dart';
import 'package:rumi_notes/view/components/card_list.dart';

class mobile_body extends StatelessWidget {
  const mobile_body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: background_color_app,
        appBar: app_bar(appName),
        body: const card_list());
  }
}
