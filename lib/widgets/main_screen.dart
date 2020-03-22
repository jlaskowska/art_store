import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_cart/localizations.dart';
import 'package:shopping_cart/widgets/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    HomeScreen(),
    PlaceholderWidget(Colors.deepOrange),
    PlaceholderWidget(Colors.green),
  ];

  void onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    const String art = 'Art';
    const String store = ' Store';

    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: RichText(
            text: TextSpan(
              text: art,
              style: TextStyle(
                fontFamily: GoogleFonts.fingerPaint().fontFamily,
                color: Colors.black,
                fontSize: 60,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: store,
                  style: TextStyle(fontFamily: GoogleFonts.rubik().fontFamily, fontSize: 20, color: Colors.black),
                ),
              ],
            ),
          )),
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
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            title: Text(AppLocalizations.bottomNavigationBarMenuFavourite),
          ),
        ],
      ),
      body: _children[_currentIndex],
    );
  }
}

class PlaceholderWidget extends StatelessWidget {
  final Color color;

  PlaceholderWidget(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
    );
  }
}
