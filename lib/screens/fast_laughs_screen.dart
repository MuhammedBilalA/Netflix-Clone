import 'package:flutter/material.dart';
import 'package:netflix_clone/screens/common_widgets/colors.dart';

class FastLaughsScreen extends StatelessWidget {
  const FastLaughsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: Center(
        child: Text(
          'FastLaughsScreen',
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }
}
