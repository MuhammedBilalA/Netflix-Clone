import 'package:flutter/material.dart';

class CenterIndicator extends StatelessWidget {
  const CenterIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: Colors.red,
      ),
    );
  }
}
