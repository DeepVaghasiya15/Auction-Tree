import 'package:flutter/material.dart';

class OrderReports extends StatelessWidget {
  const OrderReports({super.key});

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
            'Please Login to access reports.',
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.left,
          ),
        ),
      ),
    );
  }
}