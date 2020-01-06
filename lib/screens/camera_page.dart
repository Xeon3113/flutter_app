import 'package:flutter/material.dart';

class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  int _selectedIndex = 1;
  var _pageController = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'photo',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ]),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState((){
            _selectedIndex = index;
          });
        },
        children: <Widget>[
          _galleryPage(),
          _takePhotoPage(),
          _takeVideoPage()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 0,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        unselectedItemColor: Colors.grey[400],
        selectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey[50],
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/icon/instagram_clone_icon.png")),
            title: Text('Gallery'),
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/icon/instagram_clone_icon.png")),
            title: Text('Photo'),
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/icon/instagram_clone_icon.png")),
            title: Text('Video'),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) => _onItemTapped(context, index),
      ),
    );
  }

  void _onItemTapped(BuildContext context, int index){
    _pageController.animateToPage(index, curve: Curves.easeInOut, duration: Duration(milliseconds: 200));
  }

  Widget _galleryPage(){
    return Container(color: Colors.green,);
  }
  Widget _takePhotoPage(){
    return Container(color: Colors.purple,);
  }
  Widget _takeVideoPage(){
    return Container(color: Colors.deepOrange,);
  }
}
