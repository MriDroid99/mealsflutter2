import 'package:flutter/material.dart';

// Screen
import './categories_screen.dart';
import './favorite_screen.dart';

// Widget
import '../widget/drawer_widget.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _currentIndex = 0;
  late List<Map<String, dynamic>> _pages;

  void changeIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    _pages = [
      {
        'title': 'CATEGORIES',
        'body': CategoriesScreen(),
      },
      {
        'title': 'FAVORITE',
        'body': FavoriteScreen(),
      },
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_currentIndex]['title']),
      ),
      drawer: Drawer(
        child: DrawerWidget(),
      ),
      body: _pages[_currentIndex]['body'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: _currentIndex,
        onTap: changeIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'CATEGORY',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'FAVORITE',
          ),
        ],
      ),
    );
  }
}
