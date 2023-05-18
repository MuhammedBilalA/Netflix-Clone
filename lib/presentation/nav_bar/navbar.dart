import 'package:flutter/material.dart';
import 'package:netflix_clone/presentation/downloads/downloads_screen.dart';
import 'package:netflix_clone/presentation/fast_laugh/fast_laughs_screen.dart';
import 'package:netflix_clone/presentation/home/home_screen.dart';
import 'package:netflix_clone/presentation/news_and_hot/news_and_hot_screen.dart';
import 'package:netflix_clone/presentation/search/search_screen.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int cIndex = 0;
  @override
  Widget build(BuildContext context) {
    List screens = [
      HomeScreen(),
      const NewsAndHotScreen(),
      const FastLaughsScreen(),
      const SearchScreen(),
      const DownloadsScreen(),
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
