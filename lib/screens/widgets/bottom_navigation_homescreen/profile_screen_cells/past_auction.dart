import 'package:flutter/material.dart';
import '../../../../api/property_detail.dart';
import '../../../../model/property_model.dart';
import '../../../propertyDetail_screen.dart';
import '../../propertyCard.dart';

class PastAuction extends StatelessWidget {
  const PastAuction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('building past auction');
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
            List<Property> filteredProperties = properties.where((property) => property.propertyIndex > 5).toList();

            print('Filtered properties count: ${filteredProperties.length}');
            filteredProperties.forEach((property) {
              print('Property Index: ${property.propertyIndex}');
            });

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
                                    propertyIndex: property.propertyIndex,
                                    title4: property.title4,
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
