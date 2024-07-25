import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../model/discover_screen_provider.dart';
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

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _searchFocusNode.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.extentAfter < 500 && !Provider.of<DiscoverProvider>(context, listen: false).isLoadingMore) {
      Provider.of<DiscoverProvider>(context, listen: false).loadMoreProperties();
    }
  }

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
                Consumer<DiscoverProvider>(
                  builder: (context, provider, child) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildIconSquare(Icons.all_inclusive, 'All', ATColor, provider.selectedCategory, provider.updateCategory),
                        _buildIconSquare(Icons.landscape_rounded, 'Land', ATColor, provider.selectedCategory, provider.updateCategory),
                        _buildIconSquare(Icons.business, 'Commercial', ATColor, provider.selectedCategory, provider.updateCategory),
                        _buildIconSquare(Icons.home_filled, 'Residential', ATColor, provider.selectedCategory, provider.updateCategory),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Consumer<DiscoverProvider>(
              builder: (context, provider, child) {
                return ListView.builder(
                  controller: _scrollController,
                  padding: const EdgeInsets.fromLTRB(16.0, 0, 16, 16),
                  itemCount: provider.displayedProperties.length + (provider.isLoadingMore ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index == provider.displayedProperties.length) {
                      return Center(child: CircularProgressIndicator());
                    }

                    final property = provider.displayedProperties[index];
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
                            provider.updateTitle(property['title']!);
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
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIconSquare(IconData icon, String label, Color color, String selectedCategory, void Function(String) updateCategory) {
    return GestureDetector(
      onTap: () => updateCategory(label),
      child: Column(
        children: [
          Container(
            width: 80,
            height: 40,
            decoration: BoxDecoration(
              color: selectedCategory == label ? color.withOpacity(0.3) : Colors.white,
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
