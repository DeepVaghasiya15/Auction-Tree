import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../../model/property_model.dart';
import '../../../propertyDetail_screen.dart';
import '../../propertyCard.dart';

Future<List<Property>> fetchProperties() async {
  final response = await http.get(Uri.parse('https://api-9bea.onrender.com/properties/'));

  if (response.statusCode == 200) {
    List<dynamic> body = json.decode(response.body);
    List<Property> properties = body.map((dynamic item) => Property.fromJson(item)).toList();
    return properties;
  } else {
    throw Exception('Failed to load properties');
  }
}

class PastAuction extends StatelessWidget {
  const PastAuction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Past Auctions', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Property>>(
        future: fetchProperties(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Failed to load properties'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No properties available'));
          } else {
            List<Property> properties = snapshot.data!;
            // Filter properties with index greater than 5
            List<Property> filteredProperties = properties.where((property) => property.index > 5).toList();

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 0, 16, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    ...filteredProperties.map((property) {
                      return Column(
                        children: [
                          PropertyCard(
                            imageAssetPath: property.imageAssetPath,
                            type: property.type,
                            title: property.title,
                            address: property.address,
                            builtUpArea: property.builtUpArea,
                            lotSize: property.lotSize,
                            auctionStatus: property.auctionStatus,
                            currentBid: property.currentBid,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PropertyDetailScreen(
                                    title: property.title,
                                    id: property.id,
                                    address: property.address,
                                    imagePaths: property.imagePaths,
                                    auctionStatus: property.auctionStatus,
                                    latitude: property.latitude,
                                    longitude: property.longitude,
                                    description: property.description,
                                    propertyIndex: property.index,
                                    title4: property.title4FC,
                                    subtitleFC: property.subtitleFC,
                                    subtitle2FC: property.subtitle2FC,
                                    subtitle3FC: property.subtitle3FC,
                                    subtitle4FC: property.subtitle4FC,
                                    trailingFC: property.trailingFC,
                                    trailing2FC: property.trailing2FC,
                                    trailing3FC: property.trailing3FC,
                                    trailing4FC: property.trailing4FC,
                                  ),
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: 10),
                        ],
                      );
                    }).toList(),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
