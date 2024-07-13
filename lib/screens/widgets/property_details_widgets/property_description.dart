import 'package:flutter/material.dart';

class PropertyDescription extends StatelessWidget {
  const PropertyDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      // height: 150, // Set a fixed height
      child: Card(
        elevation: 2,
        margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'You can use for business activities.',
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.left,
          ),
        ),
      ),
    );
  }
}