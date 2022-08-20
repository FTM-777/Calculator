import 'package:calculator/calculator_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'constant.dart';

void main() {
  runApp(Application());
}

class Application extends StatefulWidget {
  const Application({Key? key}) : super(key: key);

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  get defaultThemeMode => null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculator_screen(),
    );
  }
}
