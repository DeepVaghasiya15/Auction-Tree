import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

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
            Container(
              margin: EdgeInsets.all(screenSize.width * 0.05),
              padding: EdgeInsets.symmetric(
                vertical: screenSize.height * 0.01,
                horizontal: screenSize.width * 0.26,
              ),
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(10, 15),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: screenSize.height * 0.02),
                  CircleAvatar(
                    radius: screenSize.width * 0.12,
                    backgroundImage:
                    AssetImage('assets/images/Broker/andreNotice.jpg'),
                  ),
                  SizedBox(height: screenSize.height * 0.01),
                  Text(
                    'Andre Notice',
                    style: TextStyle(
                      fontSize: screenSize.width * 0.06,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: screenSize.height * 0.02),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Edit Profile',
                      style: TextStyle(color: Colors.black),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      backgroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(
                        horizontal: screenSize.width * 0.08,
                        vertical: screenSize.height * 0.01,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenSize.height * 0.01),
            buildProfileOption(context, Icons.shopping_bag_outlined, 'Buy',
                Color(0xFFCA996E), '/buy'),
            buildProfileOption(context, Icons.monetization_on_outlined, 'Sell',
                Color(0xFFCA996E), '/login'),
            buildProfileOption(context, Icons.gavel, 'Past Auction',
                Color(0xFFCA996E), '/pastAuction'),
            buildProfileOption(context, Icons.people_alt_outlined, 'Brokers',
                Color(0xFFCA996E), '/brokers'),
            buildProfileOption(context, Icons.info, 'About Us',
                Color(0xFFCA996E), '/about_us'),
            buildProfileOption(context, Icons.mail_outline, 'Contact Us',
                Color(0xFFCA996E), '/contact_us'),
            buildProfileOption(
                context, Icons.logout, 'Log out', Color(0xFFCA996E), '/login'),
          ],
        ),
      ),
    );
  }

  Widget buildProfileOption(BuildContext context, IconData icon, String title,
      Color color, String routeName) {
    final screenSize = MediaQuery.of(context).size;

    return ListTile(
      leading: Icon(icon, color: color, size: screenSize.width * 0.06),
      title: Text(
        title,
        style: TextStyle(fontSize: screenSize.width * 0.04),
      ),
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.black, size: screenSize.width * 0.05),
      onTap: () {
        Navigator.pushNamed(context, routeName);
      },
    );
  }
}
