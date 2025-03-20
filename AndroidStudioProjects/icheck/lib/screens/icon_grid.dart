import 'package:flutter/material.dart';

class IconGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(), // Disable scrolling
      crossAxisCount: 3, // 3 icons per row
      children: List.generate(9, (index) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.face, size: 40, color: Colors.blue),
            SizedBox(height: 8),
            Text('Item ${index + 1}'),
          ],
        );
      }),
    );
  }
}