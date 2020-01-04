import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/sign_in_form.dart';
import 'package:flutter_app/widgets/sign_up_form.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  Widget currentWidget = SignInForm();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              child: currentWidget,
            ),
            _goToSignUpPageBtn(context),
          ],
        ),
      ),
    );
  }

  Positioned _goToSignUpPageBtn(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      height: 40,
      child: FlatButton(
        shape: Border(top: BorderSide(color: Colors.grey[300])),
        onPressed: () {
          setState(() {
            if (currentWidget is SignInForm) {
              currentWidget = SignUpForm();
            } else {
              currentWidget = SignInForm();
            }
          });
        },
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            // 자식 TextSpan들이 style 상속 받는다.
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.blue),
            children: <TextSpan>[
              TextSpan(
                  text: currentWidget is SignUpForm
                      ? "Already have an account?"
                      : "Don't have an account?",
                  style: TextStyle(
                      fontWeight: FontWeight.w300, color: Colors.black54)),
              TextSpan(
                text: currentWidget is SignUpForm ? "  Sign In" : "  Sign up",
              )
            ],
          ),
        ),
      ),
    );
  }
}
