import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void simpleSnackBar(BuildContext context, String txt) {
  final snackbar = SnackBar(content: Text(txt));
  Scaffold.of(context).showSnackBar(snackbar);
}