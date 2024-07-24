import 'package:at_app/screens/home_screen_new.dart';
import 'package:at_app/screens/login/login.dart';
import 'package:at_app/screens/login/register.dart';
import 'package:at_app/screens/propertyDetail_screen.dart';
import 'package:at_app/screens/widgets/bottom_navigation_homescreen/brokers_screen.dart';
import 'package:at_app/screens/widgets/bottom_navigation_homescreen/discover_screen.dart';
import 'package:at_app/screens/widgets/bottom_navigation_homescreen/profile_screen_cells/about_us.dart';
import 'package:at_app/screens/widgets/bottom_navigation_homescreen/profile_screen_cells/buy_screen.dart';
import 'package:at_app/screens/widgets/bottom_navigation_homescreen/profile_screen_cells/past_auction.dart';
import 'package:at_app/splash.dart';
import 'package:at_app/theme/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data/brokers_data.dart';
import 'model/discover_screen_provider.dart';
import 'model/toggle_button_provider_property_detail_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DiscoverProvider()),
        ChangeNotifierProvider(create: (context) => ToggleButtonProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
      ],
      child: const MyApp(),
    ),
  );
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
        '/buy': (context) => DiscoverScreen(),
        '/brokers': (context) => BrokersScreen(),
        '/about_us': (context) => AboutUs(),
        '/propertyDetail': (context) => PropertyDetailScreen(
          // These will be populated with actual data in navigation
          imagePaths: [],
          title: '',
          id: '',
          address: '',
          auctionStatus: '',
          latitude: '',
          longitude: '',
          description: '',
          propertyIndex: 0,
          title4: '',
          subtitleFC: '',
          subtitle2FC: '',
          subtitle3FC: '',
          subtitle4FC: '',
          trailingFC: '',
          trailing2FC: '',
          trailing3FC: '',
          trailing4FC: '',
        ),
      },
    );
  }
}
