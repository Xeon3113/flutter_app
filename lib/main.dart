import 'package:flutter/material.dart';
import 'package:flutter_app/screens/signin_page.dart';

import 'constants/material_color.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignInPage(),
      theme: ThemeData(primarySwatch: white),
    );
  }
}
