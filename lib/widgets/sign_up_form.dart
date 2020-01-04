import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/constants/size.dart';
import 'package:flutter_app/main_page.dart';
import 'package:flutter_app/utils/simple_snackbar.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _pwController = TextEditingController();
  TextEditingController _cpwController = TextEditingController();

  // TextEditingController 사용하게 되면 반드시 dispose @override 해줘야 한다.
  @override
  void dispose() {
    _emailController.dispose();
    _pwController.dispose();
    _cpwController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 30, right: common_gap, bottom: common_gap, left: common_gap),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Image.asset('assets/insta_text_logo.png'),
              Padding(
                padding: const EdgeInsets.only(top: common_s_gap),
                child: TextFormField(
                  controller: _emailController,
                  decoration: getTextFieldDecor("Email"),
                  validator: (String value) {
                    if (value.isEmpty || !value.contains("@")) {
                      return 'Please enter your email address';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: common_s_gap),
                child: TextFormField(
                    obscureText: true,
                    controller: _pwController,
                    decoration: getTextFieldDecor("Password"),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please enter password';
                      }
                      return null;
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(top: common_s_gap),
                child: TextFormField(
                    obscureText: true,
                    controller: _cpwController,
                    decoration: getTextFieldDecor("Confirm Password"),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please confirm password';
                      }
                      else if (value != _pwController.text) {
                        return 'Password does not match';
                      }
                      return null;
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(top: common_s_gap),
                child: FlatButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      final route = MaterialPageRoute(builder: (context)=>MainPage());
                      // push를 이용하면 스택 뒤로 밀려가 back button 누를시 다시 돌아오게 된다.
                      Navigator.pushReplacement(context, route);
                    }
                  },
                  child: Text(
                    "Join",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: common_s_gap),
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Positioned(
                      left: 0,
                      right: 0,
                      height: 1,
                      child: Container(
                        color: Colors.grey[300],
                        height: 1,
                      ),
                    ),
                    Container(
                      height: 3,
                      width: 50,
                      color: Colors.grey[50],
                    ),
                    Text(
                      'OR',
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: common_s_gap),
                child: FlatButton.icon(
                  textColor: Colors.blue,
                  onPressed: () {
                    simpleSnackBar(context, "facebook pressed");
                  },
                  icon: ImageIcon(
                    AssetImage("assets/icon/facebook.png"),
                  ),
                  label: Text("Sign in with Facebook"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration getTextFieldDecor(String hint) {
    return InputDecoration(
      hintText: hint,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey[300],
          width: 1,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey[300],
          width: 1,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      fillColor: Colors.grey[100],
      filled: true,
    );
  }
}
