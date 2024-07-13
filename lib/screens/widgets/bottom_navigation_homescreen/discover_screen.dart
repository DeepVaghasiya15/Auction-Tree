import 'package:flutter/material.dart';
import '../propertyCard.dart';
import 'discover_screen_widgets/search_bar_widget.dart';

class DiscoverScreen extends StatefulWidget {
  @override
  _DiscoverScreenState createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  final FocusNode _searchFocusNode = FocusNode();

  @override
  void dispose() {
    _searchFocusNode.dispose();
    super.dispose();
  }

  // Method to handle navigation to the search screen
  void navigateToSearchScreen() async {
    _searchFocusNode.unfocus();
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SearchScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Your Location',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      'Ahmedabad',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10), // Spacing between location and search bar
                TextField(
                  focusNode: _searchFocusNode,
                  onTap: navigateToSearchScreen, // Navigate to search screen on tap
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    fillColor: Colors.black.withOpacity(0.1),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                    prefixIcon: const Icon(Icons.search),
                  ),
                ),
                const SizedBox(height: 15), // Spacing between search bar and icons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildIconSquare(Icons.terrain, 'Land', const Color(0xFFCA996E)),
                    _buildIconSquare(Icons.business, 'Commercial', const Color(0xFFCA996E)),
                    _buildIconSquare(Icons.home_filled, 'Residential', const Color(0xFFCA996E)),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 0, 16, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Featured Property',
                      style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
                    PropertyCard(
                      imageAssetPath: 'assets/images/commercial.webp',
                      type: 'Commercial Plaza',
                      title: 'Perfect Plaza',
                      address: 'New York St, New York, NY 10001, United States',
                      builtUpArea: '25,000 sqft',
                      lotSize: '3 Acres',
                      onTap: () {
                        Navigator.pushNamed(context, '/propertyDetailScreen');
                      },
                    ),
                    SizedBox(height: 10),
                    PropertyCard(
                      imageAssetPath: 'assets/images/commercialPlaza.jpg',
                      type: 'Commercial Plaza',
                      title: 'My Plaza',
                      address: 'Florida A1A, Miami, FL 33125, United States',
                      builtUpArea: '10,000 sqft',
                      lotSize: '2 Acres',
                    ),
                    SizedBox(height: 10),
                    PropertyCard(
                      imageAssetPath: 'assets/images/megmaCommercial.webp',
                      type: 'Hotel',
                      title: 'Megma',
                      address: "Indira Gandhi Int'l T3 Rd, Delhi, DL 110037, India",
                      builtUpArea: '150,000 sqft',
                      lotSize: '30 Acres',
                    ),
                    SizedBox(height: 10), // Additional spacing at the bottom
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIconSquare(IconData icon, String label, Color color) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              color: Colors.grey,
              width: 2.0,
            ),
          ),
          child: Icon(icon, size: 30, color: color),
        ),
        Text(label, style: TextStyle(fontSize: 14)),
      ],
    );
  }
}
