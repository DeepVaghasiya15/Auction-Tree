
import 'package:at_app/screens/widgets/propertyCard.dart';
import 'package:flutter/material.dart';

import '../data/homepage_searchFilter_data.dart';
import '../data/homepage_topImage_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // Default selected index for tabs

  String _selectedCountry = 'All Countries';
  String _selectedPropertyType = 'All Property Types';
  String _selectedAuction = 'All Auctions';
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: Center(
          child: Image.asset(
            'assets/images/auctiontree-logo.png',
            height: 20, // Adjust the height as needed
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  images[
                      _selectedIndex], // Dynamic image based on tab selection
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height *
                      0.5, // Half of the screen height
                ),
                Container(
                  color: Colors.black
                      .withOpacity(0.45), // Adjust opacity as needed
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        titles[
                            _selectedIndex], // Dynamic title based on tab selection
                        style:
                            const TextStyle(color: Colors.white, fontSize: 28),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        subtitles[
                            _selectedIndex], // Dynamic subtitle based on tab selection
                        style: const TextStyle(
                            color: Colors.white70, fontSize: 18),
                      ),
                      const SizedBox(height: 90),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0), // Add padding to the left and right
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    _selectedIndex = 1;
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: _selectedIndex == 1 ? Colors.white : const Color(0xFFCA996E),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.landscape),
                                    SizedBox(height: 2),
                                    Text('Land',style: TextStyle(fontSize: 11.9),),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    _selectedIndex = 2;
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: _selectedIndex == 2 ? Colors.white : const Color(0xFFCA996E),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.storefront),
                                    SizedBox(height: 2),
                                    Text('Commercial',style: TextStyle(fontSize: 11.9),),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    _selectedIndex = 3;
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: _selectedIndex == 3 ? Colors.white : const Color(0xFFCA996E),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.home),
                                    SizedBox(height: 4),
                                    Text('Residential',style: TextStyle(fontSize: 11.9),),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.location_on,
                                color: Color(0xFFCA996E)),
                            const SizedBox(width: 8.0),
                            Expanded(
                              child: DropdownButton<String>(
                                value: _selectedCountry,
                                isExpanded: true,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    _selectedCountry = newValue!;
                                  });
                                },
                                items:
                                    CountryData.map<DropdownMenuItem<String>>(
                                        (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                        // Divider(),
                        Row(
                          children: [
                            const Icon(
                              Icons.search,
                              color: Color(0xFFDDB88B),
                            ),
                            const SizedBox(width: 8.0),
                            Expanded(
                              child: TextFormField(
                                controller: _searchController,
                                decoration: const InputDecoration(
                                  hintText:
                                      'Search State, City, Zip or Address',
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Divider(),
                        Padding(
                          padding: const EdgeInsets.only(left: 7.0, right: 7.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: DropdownButton<String>(
                                  value: _selectedPropertyType,
                                  isExpanded: true,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      _selectedPropertyType = newValue!;
                                    });
                                  },
                                  items: PropertyType.map<
                                      DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                              const SizedBox(width: 16.0),
                              Expanded(
                                child: DropdownButton<String>(
                                  value: _selectedAuction,
                                  isExpanded: true,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      _selectedAuction = newValue!;
                                    });
                                  },
                                  items:
                                      AuctionType.map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Implement your search functionality here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFDDB88B),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32.0, vertical: 16.0),
                    ),
                    child: const Text('Search', style: TextStyle(fontSize: 16)),
                  ),
                  const SizedBox(height: 20),
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
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}