// import 'dart:convert';
// import 'package:at_app/model/property_model.dart';
// import 'package:http/http.dart' as http;
//
// Future<List<Property>> fetchProperties() async {
//   final response = await http.get(Uri.parse('http://localhost:7777/properties/'));
//
//   if (response.statusCode == 200) {
//     List<dynamic> body = jsonDecode(response.body);
//     List<Property> properties = body.map((dynamic item) => Property.fromJson(item)).toList();
//     return properties;
//   } else {
//     throw Exception('Failed to load properties');
//   }
// }
