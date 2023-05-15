import 'package:flutter/material.dart';
import 'package:netflix_clone/core/color/colors.dart';

class DownloadsScreen extends StatelessWidget {
  const DownloadsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: Center(
        child: Text(
          'Downloads',
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }
}