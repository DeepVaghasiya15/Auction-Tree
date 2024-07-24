import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../data/brokers_data.dart';

class BrokersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('building brokerscreen');
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Brokers',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<UserProvider>(
          builder: (context, userProvider, child) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns in the grid
                crossAxisSpacing: 8.0, // Spacing between columns
                mainAxisSpacing: 8.0, // Spacing between rows
                childAspectRatio: 3 / 4, // Aspect ratio of the items
              ),
              itemCount: userProvider.users.length,
              itemBuilder: (context, index) {
                return UserCard(user: userProvider.users[index]);
              },
            );
          },
        ),
      ),
    );
  }
}

class UserCard extends StatelessWidget {
  final User user;

  const UserCard({required this.user, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('building usercard');
    final screenSize = MediaQuery.of(context).size;
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: screenSize.height * 0.2,
            width: screenSize.height * 0.22, // Adjust the height as needed
            child: AspectRatio(
              aspectRatio: 3 / 4, // Aspect ratio of the image
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0), // Adjust the radius as needed
                child: Image.asset(
                  user.imageUrl,
                  fit: BoxFit.cover, // Use BoxFit.cover to avoid distortion
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
                fontSize: 13,
              ),
              textAlign: TextAlign.center,
              overflow: TextOverflow.fade,
            ),
          ),
        ],
      ),
    );
  }
}
