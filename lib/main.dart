import 'package:at_app/screens/home_screen_new.dart';
import 'package:at_app/screens/login/login.dart';
import 'package:at_app/screens/login/register.dart';
import 'package:at_app/screens/propertyDetail_screen.dart';
import 'package:at_app/screens/widgets/bottom_navigation_homescreen/profile_screen_cells/past_auction.dart';
import 'package:at_app/splash.dart';
import 'package:at_app/theme/light_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Auction Tree',
      theme: lightMode,
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => SplashScreen(),
        '/login': (context) => LogIn(),
        '/register': (context) => Register(),
        '/homescreennew': (context) => HomeScreenNew(),
        '/pastAuction': (context) => PastAuction(),
        // '/propertyDetailScreen': (context) => PropertyDetailScreen(title: '', id: '', address: '',),
      },
    );
  }
}
