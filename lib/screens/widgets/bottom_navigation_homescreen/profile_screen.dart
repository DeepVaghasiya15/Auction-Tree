import 'package:flutter/material.dart';

import '../../../theme/light_theme.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('Building Profile Screen');
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        centerTitle: false,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left:screenSize.width * 0.06,right:screenSize.width * 0.06,bottom:screenSize.width * 0.06),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: screenSize.height * 0.02),
                  CircleAvatar(
                    radius: screenSize.width * 0.12,
                    backgroundImage:
                    const AssetImage('assets/images/Broker/andreNotice.jpg'),
                  ),
                  SizedBox(width: screenSize.width * 0.1),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Andre Notice',
                        style: TextStyle(
                          fontSize: screenSize.width * 0.06,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'Broker',
                        style: TextStyle(
                          fontSize: screenSize.width * 0.03,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(height: screenSize.height * 0.02),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          backgroundColor: Colors.black87,
                          padding: EdgeInsets.symmetric(
                            horizontal: screenSize.width * 0.08,
                            vertical: screenSize.height * 0.01,
                          ),
                        ),
                        child: const Text(
                          'Edit Profile',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(thickness: 0.1,indent: 15,endIndent: 27,),
            SizedBox(height: screenSize.height * 0.01),
            buildProfileOption(context, Icons.shopping_bag_outlined, 'Buy',
                ATColor, '/buy'),
            buildProfileOption(context, Icons.monetization_on_outlined, 'Sell',
                ATColor, '/login'),
            buildProfileOption(context, Icons.gavel, 'Past Auction',
                ATColor, '/pastAuction'),
            buildProfileOption(context, Icons.people_alt_outlined, 'Brokers',
                ATColor, '/brokers'),
            buildProfileOption(context, Icons.info, 'About Us',
                ATColor, '/about_us'),
            buildProfileOption(context, Icons.mail_outline, 'Contact Us',
                ATColor, '/contact_us'),
            buildProfileOption(
                context, Icons.logout, 'Log out', Colors.red, '/login'),
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
        style: TextStyle(fontSize: screenSize.width * 0.04,color: title == 'Log out' ? Colors.red : Colors.black),
      ),
      trailing: Icon(title == 'Log out' ? null : Icons.arrow_forward_ios_rounded, color: Colors.black, size: screenSize.width * 0.05),
      onTap: () {
        Navigator.pushNamed(context, routeName);
      },
    );
  }
}
