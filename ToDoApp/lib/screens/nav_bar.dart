import 'package:ToDoApp/screens/home_screen.dart';
import 'package:ToDoApp/screens/tasks_screen.dart';
import 'package:ToDoApp/widgets/fab.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  bool isSelected = false;
  int _currentIndex = 0;

  final List<Widget> allScreens = <Widget>[
    HomeScreen(),
    TasksScreen(),
  ];

  Widget _bottomNav() {
    return BottomNavigationBar(
      iconSize: 30,
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        elevation: 10,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.view_quilt),
            title: Text('Task'),
          ),
        ]);
  }

  floatActionPressed() {

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: allScreens[_currentIndex],
      bottomNavigationBar: _bottomNav(),
      floatingActionButton: FAB(
        onPressed: floatActionPressed,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
