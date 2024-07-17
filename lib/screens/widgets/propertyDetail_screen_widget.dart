import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoSection extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const InfoSection({
    Key? key,
    required this.icon,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: Color(0xFFCA996E)),
            Text(title, style: TextStyle(color: Colors.grey)),
          ],
        ),
        Text(value, style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
      ],
    );
  }
}

class PropertyDetailsWidget extends StatelessWidget {
  List<Map<String, dynamic>> propertyData;

  PropertyDetailsWidget({Key? key, required this.propertyData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: propertyData.map((data) {
        return InfoSection(
          icon: data['icon'],
          title: data['title'],
          value: data['value'],
        );
      }).toList(),
    );
  }
}