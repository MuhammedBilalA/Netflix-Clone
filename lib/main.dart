import 'package:flutter/material.dart';
import 'package:netflix_clone/presentation/nav_bar/navbar.dart';

void main(List<String> args) {
  runApp(const NetflixClone());
}

class NetflixClone extends StatelessWidget {
  const NetflixClone({super.key});
  final MaterialColor black = const MaterialColor(0xFF000000, <int, Color>{
    50: Color(0xFFFAFAFA),
    100: Color(0xFFF5F5F5),
    200: Color(0xFFEEEEEE),
    300: Color(0xFFE0E0E0),
    400: Color(0xFFBDBDBD),
    500: Color(0xFF9E9E9E),
    600: Color(0xFF757575),
    700: Color(0xFF616161),
    800: Color(0xFF424242),
    900: Color(0xFF212121),
  });
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: black),
      home: NavBar(),
    );
  }
}
