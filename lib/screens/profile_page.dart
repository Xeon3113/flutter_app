import 'package:flutter/material.dart';
import 'package:flutter_app/constants/size.dart';
import 'package:flutter_app/utils/profile_img_path.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _menuOpened = false;
  Size size;
  double _menuWidth;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    _menuWidth = size.width / 1.5;

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
          _menuOpened ? size.width - _menuWidth : size.width, 0, 0),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            FlatButton(
              child: Text('Xeon3113'),
              onPressed: null,
            )
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
                  SliverList(
                      delegate: SliverChildListDelegate([
                    _getProfileHeader,
                    _username(),
                    _userBio(),
                    _email(),
                    _editPropfileBtn()
                  ])),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding _editPropfileBtn() {
    return Padding(
      padding: const EdgeInsets.all(common_gap),
      child: SizedBox(
        height: 24,
        child: FlatButton(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
              side: BorderSide(
                  color: Colors.black87, width: 1, style: BorderStyle.solid),
            ),
            onPressed: () {},
            child: Text('Edit Profile',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ))),
      ),
    );
  } // 프로필 수정 버튼

  Padding _email() {
    return Padding(
      padding: const EdgeInsets.only(left: common_gap),
      child: Text('arangluv@gmail.com',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          )),
    );
  } // email 출력 부분

  Padding _userBio() {
    return Padding(
      padding: const EdgeInsets.only(left: common_gap),
      child: Text('Flutter를 배워봅시다~',
          style: TextStyle(
              fontWeight: FontWeight.w300, fontSize: common_xl_fontSize)),
    );
  } // 상태값 출력

  Padding _username() {
    return Padding(
      padding: const EdgeInsets.only(left: common_gap),
      child: Text(
        'Lee Chanhee',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  } // 이름 출력

  Row get _getProfileHeader => Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(common_gap),
            child: CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(getProfileImgPath("Xeon3113")),
            ),
          ),
          Expanded(
            child: Table(
              children: [
                TableRow(children: [
                  _getStatusValueWidget('123'),
                  _getStatusValueWidget('234'),
                  _getStatusValueWidget('5432'),
                ]),
                TableRow(children: [
                  _getStatusLabesWidget('Posts'),
                  _getStatusLabesWidget('Followers'),
                  _getStatusLabesWidget('Following'),
                ]),
              ],
            ),
          )
        ],
      );

  Widget _getStatusValueWidget(String value) => Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: common_s_gap,
          ),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              value,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      );

  Widget _getStatusLabesWidget(String value) => Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: common_s_gap,
          ),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              value,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      );

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
          },
        ),
      ],
    );
  }
}
