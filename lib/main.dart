import 'package:flutter/material.dart';
import 'package:netflix_clone/screens/navbar.dart';

void main(List<String> args) {
  runApp(const NetflixClone());
}

class NetflixClone extends StatelessWidget {
  const NetflixClone({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  NavBar(),
    );
  }
}
