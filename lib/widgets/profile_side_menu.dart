import 'package:flutter/material.dart';
import 'package:flutter_app/constants/size.dart';
import 'package:flutter_app/screens/auth_page.dart';

class ProfileSideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border: Border(left: BorderSide(color: Colors.grey[300]))),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(common_gap),
                child: Text(
                  'Settings',
                  style: TextStyle(
                      color: Colors.black87, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                color: Colors.grey[300],
                height: 1,
              ),
              FlatButton.icon(
                onPressed: (){
                  final route = MaterialPageRoute(builder: (context)=>AuthPage());
                  // push를 이용하면 스택 뒤로 밀려가 back button 누를시 다시 돌아오게 된다.
                  Navigator.pushReplacement(context, route);
                },
                icon: Icon(Icons.exit_to_app),
                label: Text('Log out',
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                    )),
              ),
            ]));
  }
}
