import 'package:flutter/material.dart';
import '../../../data/property_card_data.dart';
import '../propertyCard.dart';
import 'discover_screen_widgets/search_bar_widget.dart';

class DiscoverScreen extends StatefulWidget {
  @override
  _DiscoverScreenState createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  final FocusNode _searchFocusNode = FocusNode();
  String _selectedCategory = '';

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

  // Method to update the selected category
  void _updateCategory(String category) {
    setState(() {
      _selectedCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> displayedProperties = Properties;

    if (_selectedCategory.isNotEmpty) {
      displayedProperties = Properties
          .where((property) => property['category'] == _selectedCategory)
          .toList();
    }

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
                    const Text(
                      'Featured Property',
                      style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    ...displayedProperties.map((property) => Column(
                      children: [
                        PropertyCard(
                          imageAssetPath: property['imageAssetPath']!,
                          type: property['type']!,
                          title: property['title']!,
                          address: property['address']!,
                          builtUpArea: property['builtUpArea']!,
                          lotSize: property['lotSize']!,
                          auctionStatus: property['auctionStatus']!,
                          currentBid: property['currentBid']!,
                          onTap: () {
                            // Handle navigation here
                            // Navigator.pushNamed(context, '/propertyDetailScreen');
                          },
                        ),
                        const SizedBox(height: 10),
                      ],
                    )),
                    const SizedBox(height: 10), // Additional spacing at the bottom
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
    return GestureDetector(
      onTap: () => _updateCategory(label),
      child: Column(
        children: [
          Container(
            width: 100,
            height: 40,
            decoration: BoxDecoration(
              color: _selectedCategory == label ? color.withOpacity(0.3) : Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                color: Colors.grey,
                width: 2.0,
              ),
            ),
            child: Icon(icon, size: 30, color: color),
          ),
          Text(label, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}
