import 'package:flutter/material.dart';
import 'package:flutter_app/main_page.dart';

import 'constants/material_color.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
      theme: ThemeData(primarySwatch: white),
    );
  }
}
