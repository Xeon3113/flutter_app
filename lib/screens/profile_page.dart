import 'package:flutter/material.dart';
import 'package:flutter_app/constants/size.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _menuOpened = false;
  Size _size;
  double _menuWidth;

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    _menuWidth = _size.width / 1.5;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          _sideMenu(),
          _profile(),
        ],
      ),
    );
  }

  Widget _sideMenu() {
    return AnimatedContainer(
      width: _menuWidth,
      curve: Curves.easeInOut,
      color: Colors.grey[200],
      duration: Duration(milliseconds: 250),
      transform: Matrix4.translationValues(
          _menuOpened ? _size.width - _menuWidth : _size.width, 0, 0),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            FlatButton(child: Text('Xeon3113'), onPressed: null,)
          ],
        ),
      ),
    );
  }

  Widget _profile() {
    return AnimatedContainer(
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 250),
      transform: Matrix4.translationValues(_menuOpened ? -_menuWidth : 0, 0, 0),
      child: SafeArea(
        child: Column(
          children: <Widget>[
            _userNameIconButton(),
            Expanded(
              child: CustomScrollView(
                slivers: <Widget>[

                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Row _userNameIconButton() {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: common_gap),
          child: Text(
            'Xeon3113',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: common_xxxl_fontSize),
          ),
        ),
        Spacer(),
        IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              setState(() {
                _menuOpened = !_menuOpened;
              });
            }),
      ],
    );
  }
}
