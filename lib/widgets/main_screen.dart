import 'package:flutter/material.dart';
import 'package:art_store/localizations.dart';
import 'package:art_store/widgets/common/app_bar_title.dart';
import 'package:art_store/widgets/home_screen.dart';
import 'package:art_store/widgets/shopping_cart_screen/shopping_cart_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    HomeScreen(),
    ShoppingCartScreen(),
  ];

  void onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const AppBarTitle(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        currentIndex: _currentIndex,
        onTap: onTap,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text(AppLocalizations.bottomNavigationBarMenuHome),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            title: Text(AppLocalizations.bottomNavigationBarMenuCart),
          ),
        ],
      ),
      body: _children[_currentIndex],
    );
  }
}
