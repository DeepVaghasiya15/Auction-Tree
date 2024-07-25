import 'package:flutter/foundation.dart';

import '../data/property_card_data.dart';

class DiscoverProvider with ChangeNotifier {
  String _selectedCategory = 'All'; // Initialize to "All"
  String _selectedTitle = '';
  int _currentPage = 1;
  bool _isLoadingMore = false;
  List<Map<String, dynamic>> _displayedProperties = [];
  List<Map<String, dynamic>> _allProperties = Properties; // Assuming this is the complete list

  String get selectedCategory => _selectedCategory;
  String get selectedTitle => _selectedTitle;
  bool get isLoadingMore => _isLoadingMore;
  List<Map<String, dynamic>> get displayedProperties => _displayedProperties;

  DiscoverProvider() {
    _loadInitialProperties();
  }

  void _loadInitialProperties() {
    _displayedProperties = _allProperties.take(10).toList();
    notifyListeners();
  }

  void loadMoreProperties() {
    if (_isLoadingMore) return;

    _isLoadingMore = true;
    notifyListeners();

    Future.delayed(const Duration(seconds: 2), () {
      _currentPage++;
      if (_selectedCategory == 'All') {
        _displayedProperties.addAll(_allProperties.skip((_currentPage - 1) * 10).take(10));
      } else {
        _displayedProperties.addAll(
          _allProperties
              .where((property) => property['category'] == _selectedCategory)
              .skip((_currentPage - 1) * 10)
              .take(10),
        );
      }
      _isLoadingMore = false;
      notifyListeners();
    });
  }

  void updateCategory(String category) {
    _selectedCategory = category;
    _currentPage = 1;

    if (category == 'All') {
      _displayedProperties = _allProperties.take(10).toList();
    } else {
      _displayedProperties = _allProperties
          .where((property) => property['category'] == _selectedCategory)
          .take(10)
          .toList();
    }

    notifyListeners();
  }

  void updateTitle(String title) {
    _selectedTitle = title;
    notifyListeners();
  }
}
