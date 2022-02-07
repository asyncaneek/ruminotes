import 'package:flutter/material.dart';
import 'package:rumi_notes/view/components/colors.dart';
import 'view/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(
          iconTheme: const IconThemeData(
            color: backgroundColorApp,
          ),
          backgroundColor: backgroundColorApp,
          cardColor: backgroundColorCard,
          primarySwatch: Colors.deepPurple),
    );
  }
}
