import 'package:flutter/material.dart';
import 'package:at_app/data/homepage_searchFilter_data.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final FocusNode _focusNode = FocusNode();
  final FocusScopeNode _focusScopeNode = FocusScopeNode();

  String? selectedCountry = 'All Countries';
  String? selectedPropertyType = 'All Property Types';
  String? selectedAuction = 'All Auctions';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _unfocusAndGoBack(BuildContext context) {
    _focusScopeNode.unfocus();
    Navigator.pop(context);
  }

  void _onSearchPressed() {
    // Implement your search logic here
    print('Search pressed!');
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _unfocusAndGoBack(context);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Search'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => _unfocusAndGoBack(context),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 100.0),
          child: Container(
            height: 330.0, // Fixed height for the outer container
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey), // Grey border around the container
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                    focusNode: _focusNode,
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: const BorderSide(color: Colors.grey), // Grey border for the search bar
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                      prefixIcon: const Icon(Icons.search),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  _buildCustomDropdown(
                    value: selectedCountry,
                    items: CountryData,
                    onChanged: (String? value) {
                      setState(() {
                        selectedCountry = value;
                      });
                    },
                  ),
                  const SizedBox(height: 12.0),
                  _buildCustomDropdown(
                    value: selectedPropertyType,
                    items: PropertyType,
                    onChanged: (String? value) {
                      setState(() {
                        selectedPropertyType = value;
                      });
                    },
                  ),
                  const SizedBox(height: 12.0),
                  _buildCustomDropdown(
                    value: selectedAuction,
                    items: AuctionType,
                    onChanged: (String? value) {
                      setState(() {
                        selectedAuction = value;
                      });
                    },
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: _onSearchPressed,
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFFCA996E)), // background color
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // text color
                      minimumSize: MaterialStateProperty.all<Size>(const Size(double.infinity, 45)), // height of the button
                    ),
                    child: const Text('Search',style: TextStyle(fontSize: 20,color: Colors.black),),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCustomDropdown({
    required String? value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return DropdownButtonFormField<String>(
      value: value,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: const BorderSide(color: Colors.grey), // Grey border for the dropdown
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
      ),
      onChanged: onChanged,
      items: items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      icon: const Icon(Icons.arrow_drop_down),
      borderRadius: BorderRadius.circular(25.0),
    );
  }
}
