import 'package:flutter/material.dart';

class PropertyDescription extends StatelessWidget {
  final String description;

  const PropertyDescription({
    Key? key,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 2,
        margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            description,
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.left,
          ),
        ),
      ),
    );
  }
}
