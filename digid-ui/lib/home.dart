import 'package:flutter/material.dart';

import './profile.dart';
import './user.dart';

class Home extends StatefulWidget {
  Home({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  TextStyle titleStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  var pages = ['Profile', 'Documents', 'Settings'];

  Widget GetPage(user, index) {
    List<Widget> _widgetOptions = <Widget>[
      ProfilePage(user: user),
      Text(
        'Body',
      ),
      Text(
        'Body',
      ),
    ];

    return _widgetOptions[index];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height / 7),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color.fromARGB(255, 43, 154, 115), Color.fromARGB(255, 47, 97, 165)],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
          ),
          child: Container(
            child: Center(
              child: Text(
                pages[_selectedIndex].toUpperCase(),
                style: titleStyle,
              ),
            ),
          ),
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        ),
      ),
      body: Center(
        child: GetPage(widget.user, _selectedIndex),
      ),
      bottomNavigationBar: ClipPath(
        clipper: CurveClip(),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color.fromARGB(255, 43, 154, 115), Color.fromARGB(255, 47, 97, 165)],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
          ),
          height: MediaQuery.of(context).size.height / 10,
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 100),
          child: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded),
                label: pages[_selectedIndex],
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.inventory),
                label: pages[_selectedIndex],
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: pages[_selectedIndex],
              ),
            ],
            iconSize: 35,
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            backgroundColor: Colors.transparent,
            elevation: 0,
            unselectedItemColor: Color.fromARGB(100, 255, 255, 255),
            selectedItemColor: Colors.white,
            showUnselectedLabels: false,
            showSelectedLabels: false,
          ),
        ),
      ),
    );
  }
}

class CurveClip extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();

    path.moveTo(0, size.height);
    path.lineTo(0, size.height / 10);
    path.quadraticBezierTo(size.width / 2, 0, size.width, size.height / 10);
    path.lineTo(size.width, size.height);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}
