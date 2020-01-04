import 'package:flutter/material.dart';
import 'package:flutter_app/screens/auth_page.dart';

import 'constants/material_color.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AuthPage(),
      theme: ThemeData(primarySwatch: white),
    );
  }
}
