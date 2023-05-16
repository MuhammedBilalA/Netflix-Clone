import 'package:flutter/material.dart';
import 'package:netflix_clone/core/color/colors.dart';

class NewsAndHotScreen extends StatelessWidget {
  const NewsAndHotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: Center(
        child: Text(
          'NewsAndHotScreen',
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }
}
