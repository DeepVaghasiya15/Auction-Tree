import 'package:flutter/material.dart';
import '../../../data/property_card_data.dart';
import '../../../theme/light_theme.dart';
import '../../propertyDetail_screen.dart';
import '../propertyCard.dart';
import 'discover_screen_widgets/search_bar_widget.dart';

class DiscoverScreen extends StatefulWidget {
  @override
  _DiscoverScreenState createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  final FocusNode _searchFocusNode = FocusNode();
  final ScrollController _scrollController = ScrollController();
  String _selectedCategory = '';
  String _selectedTitle = '';
  int _currentPage = 1;
  bool _isLoadingMore = false;
  List<Map<String, dynamic>> _displayedProperties = [];
  List<Map<String, dynamic>> _allProperties = Properties; // Assuming this is the complete list

  @override
  void initState() {
    super.initState();
    _loadInitialProperties();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _searchFocusNode.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _loadInitialProperties() {
    setState(() {
      _displayedProperties = _allProperties.take(10).toList();
    });
  }

  void _loadMoreProperties() {
    if (_isLoadingMore) return;

    setState(() {
      _isLoadingMore = true;
    });

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _currentPage++;
        _displayedProperties.addAll(_allProperties.skip(_currentPage * 10).take(10));
        _isLoadingMore = false;
      });
    });
  }

  void _scrollListener() {
    if (_scrollController.position.extentAfter < 500 && !_isLoadingMore) {
      _loadMoreProperties();
    }
  }

  void navigateToSearchScreen() async {
    _searchFocusNode.unfocus();
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SearchScreen()),
    );
  }

  void _updateCategory(String category) {
    setState(() {
      _selectedCategory = category;
      _currentPage = 1;
      _displayedProperties = _allProperties.where((property) => property['category'] == _selectedCategory).take(10).toList();
    });
  }

  void _updateTitle(String title) {
    setState(() {
      _selectedTitle = title;
    });
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
                const SizedBox(height: 10),
                TextField(
                  focusNode: _searchFocusNode,
                  onTap: navigateToSearchScreen,
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
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildIconSquare(Icons.landscape_rounded, 'Land', ATColor),
                    _buildIconSquare(Icons.business, 'Commercial', ATColor),
                    _buildIconSquare(Icons.home_filled, 'Residential', ATColor),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.fromLTRB(16.0, 0, 16, 16),
              itemCount: _displayedProperties.length + (_isLoadingMore ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == _displayedProperties.length) {
                  return Center(child: CircularProgressIndicator());
                }

                final property = _displayedProperties[index];
                final imagePaths = property['imagePaths'] as List<String>? ?? [];

                return Column(
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
                        _updateTitle(property['title']!);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PropertyDetailScreen(
                              title: property['title']!,
                              id: property['id'] ?? 'ID not available',
                              address: property['address'] ?? 'Address not available',
                              imagePaths: imagePaths,
                              auctionStatus: property['auctionStatus'] ?? 'No Auction Detail',
                              latitude: property['latitude'] ?? 'No long',
                              longitude: property['longitude'] ?? 'No long',
                              description: property['description'] ?? 'No description',
                              propertyIndex: property['index'],
                              title4: property['title4FC'],
                              subtitleFC: property['subtitleFC'],
                              subtitle2FC: property['subtitle2FC'],
                              subtitle3FC: property['subtitle3FC'],
                              subtitle4FC: property['subtitle4FC'],
                              trailingFC: property['trailingFC'],
                              trailing2FC: property['trailing2FC'],
                              trailing3FC: property['trailing3FC'],
                              trailing4FC: property['trailing4FC'],
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 10),
                  ],
                );
              },
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

