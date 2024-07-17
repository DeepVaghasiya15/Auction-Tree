import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/Broker/noPhoto.jpg'), // Change to the path of your image
            ),
            SizedBox(height: 10),
            Text(
              'Deep',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                'Edit Profile',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                backgroundColor: Colors.black87,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              ),
            ),
            SizedBox(height: 20),
            Divider(thickness: 1, color: Colors.grey[300]),
            buildProfileOption(Icons.shopping_bag_outlined, 'Buy', Color(0xFFCA996E)),
            buildProfileOption(Icons.monetization_on_outlined, 'Sell', Color(0xFFCA996E)),
            buildProfileOption(Icons.gavel, 'Past Auction', Color(0xFFCA996E)),
            buildProfileOption(Icons.people_alt_outlined, 'Brokers', Color(0xFFCA996E)),
            buildProfileOption(Icons.info, 'About Us', Color(0xFFCA996E)),
            buildProfileOption(Icons.help_center_outlined, 'FAQs', Color(0xFFCA996E)),
            buildProfileOption(Icons.mail_outline, 'Contact Us', Color(0xFFCA996E)),
            buildProfileOption(Icons.logout, 'Log out', Color(0xFFCA996E)),
          ],
        ),
      ),
    );
  }

  Widget buildProfileOption(IconData icon, String title, Color color) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),
      onTap: () {
        // Add navigation or other functionality here
      },
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ProfileScreen(),
  ));
}
