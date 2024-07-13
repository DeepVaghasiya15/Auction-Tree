import 'package:at_app/screens/widgets/bottom_navigation_homescreen/brokers_screen.dart';
import 'package:at_app/screens/widgets/bottom_navigation_homescreen/discover_screen.dart';
import 'package:at_app/screens/widgets/bottom_navigation_homescreen/profile_screen.dart';
import 'package:at_app/screens/widgets/bottom_navigation_homescreen/services_screen.dart';
import 'package:flutter/material.dart';

class HomeScreenNew extends StatefulWidget {
  const HomeScreenNew({Key? key}) : super(key: key);

  @override
  State<HomeScreenNew> createState() => _HomeScreenNewState();
}

class _HomeScreenNewState extends State<HomeScreenNew> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _getSelectedWidget(_selectedIndex),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.8), // Added transparency
            borderRadius: BorderRadius.circular(30),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                spreadRadius: 2,
                blurRadius: 10,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Theme(
              data: ThemeData(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                textTheme: Theme.of(context).textTheme.copyWith(
                  bodyLarge: const TextStyle(fontFamily: 'Lato', color: Colors.white),
                ),
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                  backgroundColor: Colors.transparent,
                  selectedItemColor: Color(0xFFCA996E),
                  unselectedItemColor: Colors.white70,
                  showSelectedLabels: true,
                  showUnselectedLabels: true,
                  selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
                  unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
                ),
              ),
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.transparent,
                elevation: 0,
                selectedFontSize: 14,
                unselectedFontSize: 14,
                onTap: _onItemTapped,
                currentIndex: _selectedIndex,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.explore_rounded),
                    label: 'Discover',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.people),
                    label: 'Brokers',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.support_agent_rounded),
                    label: 'Services',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.account_circle_rounded),
                    label: 'Profile',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _getSelectedWidget(int index) {
    switch (index) {
      case 0:
        return DiscoverScreen();
      case 1:
        return BrokersScreen();
      case 2:
        return ServicesScreen();
      case 3:
        return ProfileScreen();
      default:
        return DiscoverScreen();
    }
  }
}