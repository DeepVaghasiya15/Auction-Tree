import 'package:flutter/material.dart';

class User {
  final String name;
  final String jobProfile;
  final String imageUrl;

  User({required this.name, required this.jobProfile, required this.imageUrl});
}

class UserProvider with ChangeNotifier {
  List<User> _users = [
    User(name: 'Andre Notice', jobProfile: 'Broker', imageUrl: 'assets/images/Broker/andreNotice.jpg'),
    User(name: 'Anthony Ford', jobProfile: 'Broker', imageUrl: 'assets/images/Broker/anthonyFord.png'),
    User(name: 'Daniel Okorie', jobProfile: 'THE GOLDSTEIN GROUP LLC', imageUrl: 'assets/images/Broker/noPhoto.jpg'),
    User(name: 'Denese Reed', jobProfile: 'Realtor', imageUrl: 'assets/images/Broker/noPhoto.jpg'),
    User(name: 'Jennifer Hooper', jobProfile: 'Broker', imageUrl: 'assets/images/Broker/noPhoto.jpg'),
    User(name: 'John Nwosu', jobProfile: 'POSH', imageUrl: 'assets/images/Broker/noPhoto.jpg'),
    User(name: 'Logan Poorman', jobProfile: 'Realtor JPAR The Sears Group', imageUrl: 'assets/images/Broker/LoganPoorman.jpg'),
    User(name: 'Mahvish Arif', jobProfile: 'Broker', imageUrl: 'assets/images/Broker/MahvishArif.jpg'),
    User(name: 'Parbatie Galvan', jobProfile: 'Broker Optima Realty', imageUrl: 'assets/images/Broker/ParbatieGalvan.jpeg'),
    User(name: 'Ron Aga', jobProfile: 'Realtor Texas Signature Realty', imageUrl: 'assets/images/Broker/RonAga.jpg'),
    User(name: 'Sherry Williams', jobProfile: 'Broker', imageUrl: 'assets/images/Broker/noPhoto.jpg'),
    User(name: 'Sylvia Reyes', jobProfile: 'Broker', imageUrl: 'assets/images/Broker/noPhoto.jpg'),
  ];

  List<User> get users => _users;

  void addUser(User user) {
    _users.add(user);
    notifyListeners();
  }
}
