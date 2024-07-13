import 'package:flutter/material.dart';

class User {
  final String name;
  final String jobProfile;
  final String imageUrl;

  User({required this.name, required this.jobProfile, required this.imageUrl});
}

class BrokersScreen extends StatelessWidget {
  final List<User> users = [
    User(name: 'Andre Notice', jobProfile: 'Broker', imageUrl: 'assets/images/andreNotice.jpg'),
    User(name: 'Anthony Ford', jobProfile: 'Broker', imageUrl: 'assets/images/anthonyFord.png'),
    User(name: 'Daniel Okorie', jobProfile: 'THE GOLDSTEIN GROUP LLC', imageUrl: 'assets/images/noPhoto.jpg'),
    User(name: 'Denese Reed', jobProfile: 'Realtor', imageUrl: 'assets/images/noPhoto.jpg'),
    User(name: 'Jennifer Hooper', jobProfile: 'Broker', imageUrl: 'assets/images/noPhoto.jpg'),
    User(name: 'John Nwosu', jobProfile: 'POSH', imageUrl: 'assets/images/noPhoto.jpg'),
    User(name: 'Logan Poorman', jobProfile: 'Realtor JPAR The Sears Group', imageUrl: 'assets/images/LoganPoorman.jpg'),
    User(name: 'Mahvish Arif', jobProfile: 'Broker', imageUrl: 'assets/images/MahvishArif.jpg'),
    User(name: 'Parbatie Galvan', jobProfile: 'Broker Optima Realty', imageUrl: 'assets/images/ParbatieGalvan.jpeg'),
    User(name: 'Ron Aga', jobProfile: 'Realtor Texas Signature Realty', imageUrl: 'assets/images/RonAga.jpg'),
    User(name: 'Sherry Williams', jobProfile: 'Broker', imageUrl: 'assets/images/noPhoto.jpg'),
    User(name: 'Sylvia Reyes', jobProfile: 'Broker', imageUrl: 'assets/images/noPhoto.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Brokers',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns in the grid
            crossAxisSpacing: 8.0, // Spacing between columns
            mainAxisSpacing: 8.0, // Spacing between rows
            childAspectRatio: 3 / 4, // Aspect ratio of the items
          ),
          itemCount: users.length,
          itemBuilder: (context, index) {
            return UserCard(user: users[index]);
          },
        ),
      ),
    );
  }
}

class UserCard extends StatelessWidget {
  final User user;

  const UserCard({required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 180,
            width: 200,// Adjust the height as needed
            child: AspectRatio(
              aspectRatio: 3 / 4, // Aspect ratio of the image
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0), // Adjust the radius as needed
                child: Image.asset(
                  user.imageUrl,
                  fit: BoxFit.fitWidth, // Use BoxFit.cover to avoid distortion
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 8, 8, 0),
            child: Text(
              user.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              user.jobProfile,
              style: const TextStyle(
                color: Color(0xFFCA996E),
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}