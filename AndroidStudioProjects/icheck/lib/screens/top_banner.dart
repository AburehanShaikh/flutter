import 'package:flutter/material.dart';

class TopBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/banner.jpg'), // Add your image
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}