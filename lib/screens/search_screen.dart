import 'package:flutter/material.dart';
import 'package:netflix_clone/screens/common_widgets/colors.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: Center(
        child: Text(
          'SearchScreen',
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }
}
