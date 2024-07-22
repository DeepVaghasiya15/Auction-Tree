import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/property_model.dart';

Future<List<Property>> fetchProperties() async {
  final response = await http.get(Uri.parse('https://api-9bea.onrender.com/properties/'));

  if (response.statusCode == 200) {
    final List<dynamic> data = json.decode(response.body);
    return data.map((json) => Property.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load properties');
  }
}
