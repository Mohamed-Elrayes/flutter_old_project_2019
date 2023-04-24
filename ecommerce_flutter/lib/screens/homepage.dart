import '../utilities.dart';
import '../widgets/drawer_custom.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  static const String rootName = '/homepage_screen';
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
    int currentPage = 0  ;

  final AppBar _appBar = AppBar(
    backgroundColor: colorMain,
    centerTitle: true,
    title: Text('GoToShopping Store'),
    actions: <Widget>[
      IconButton(
          icon: Icon(
            Icons.shopping_cart,
            color: Colors.white,
          ),
          onPressed: () {}),
    ],
  );

  final List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: Text('Home'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.card_giftcard),
      title: Text('Deal'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.favorite),
      title: Text('Wishlist'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      title: Text('Account'),
    ),
  ];



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: drawer,
        appBar: _appBar,
        bottomNavigationBar: BottomNavigationBar(
          items: items,
          showUnselectedLabels: true,
          unselectedItemColor: unSelectButton,
          selectedItemColor: colorMain,
          onTap: (m){
            setState(() {
              currentPage=m;
            });
          },
          currentIndex: currentPage ,
        ),
        body: Container(),
      ),
    );
  }
}
