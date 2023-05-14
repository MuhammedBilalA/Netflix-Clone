import 'package:flutter/material.dart';
import 'package:netflix_clone/screens/downloads_screen.dart';
import 'package:netflix_clone/screens/fast_laughs_screen.dart';
import 'package:netflix_clone/screens/home_screen.dart';
import 'package:netflix_clone/screens/news_and_hot_screen.dart';
import 'package:netflix_clone/screens/search_screen.dart';

class NavBar extends StatefulWidget {
 const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int cIndex = 0;
  @override
  Widget build(BuildContext context) {
    List screens =const [
      HomeScreen(),
      NewsAndHotScreen(),
      FastLaughsScreen(),
      SearchScreen(),
      DownloadsScreen(),
    ];

    List<BottomNavigationBarItem> items = const [
      BottomNavigationBarItem(
        icon: Icon(
          Icons.home,
        ),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.photo_library_rounded),
        label: 'News&Hot',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.emoji_emotions),
        label: 'Fast Laughs',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.search_rounded),
        label: 'Search',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.download),
        label: 'Downloads',
      ),
    ];
    return Scaffold(
      backgroundColor: Colors.black,
      body: screens[cIndex],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          currentIndex: cIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            cIndex = value;
            setState(() {});
          },
          items: items),
    );
  }
}
