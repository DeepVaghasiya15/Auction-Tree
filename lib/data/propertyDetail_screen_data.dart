import 'package:flutter/material.dart';

final List<String> imagePaths = [
  'assets/images/commercial.webp',
  'assets/images/commercial2.jpg',
  'assets/images/commercial3.jpg',
];

final List<Map<String, dynamic>> leftColumnData = [
  {'icon': Icons.person, 'title': 'Listed By', 'value': ' Owner'},
  {'icon': Icons.attach_money_rounded, 'title': 'Starting Bid', 'value': ' \$1000000'},
  {'icon': Icons.square_foot_rounded, 'title': 'Builtup Area(Unit in Sqft)', 'value': ' 25000'},
  {'icon': Icons.landscape_rounded, 'title': 'Lot Size(Unit in Acres)', 'value': ' 3.00'},
];

final List<Map<String, dynamic>> rightColumnData = [
  {'icon': Icons.person, 'title': 'Ownership', 'value': ' Sole Ownership'},
  {'icon': Icons.calendar_today_outlined, 'title': 'Property Built year', 'value': ' 1996'},
  {'icon': Icons.account_circle_rounded, 'title': 'Architech Name', 'value': ' Mohan'},
  {'icon': Icons.local_parking_rounded, 'title': 'Car Parking', 'value': ' Reserved'},
];