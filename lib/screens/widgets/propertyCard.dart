import 'package:flutter/material.dart';

import '../../theme/light_theme.dart';

class PropertyCard extends StatefulWidget {
  final String imageAssetPath;
  final String type;
  final String title;
  final String address;
  final String builtUpArea;
  final String lotSize;
  final String auctionStatus;
  final String currentBid;
  final VoidCallback? onTap;

  const PropertyCard({
    Key? key,
    required this.imageAssetPath,
    required this.type,
    required this.title,
    required this.address,
    required this.builtUpArea,
    required this.lotSize,
    required this.auctionStatus,
    required this.currentBid,
    this.onTap,
  }) : super(key: key);

  @override
  State<PropertyCard> createState() => _PropertyCardState();
}

class _PropertyCardState extends State<PropertyCard> {
  bool isLiked = false;

  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        elevation: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(16.0), bottom: Radius.circular(16)),
                    child: Image.asset(
                      widget.imageAssetPath,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 10,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        widget.type,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: InkWell(
                      onTap: toggleLike,
                      child: Icon(
                        isLiked ? Icons.favorite : Icons.favorite_border,
                        color: isLiked ? Colors.red : Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_pin,
                        color: ATColor,
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      Flexible(
                        child: Text(
                          widget.address,
                          style: const TextStyle(fontSize: 16, color: Colors.grey),
                          softWrap: true,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Divider(
                    color: Colors.grey,
                  ),
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(fontSize: 16, color: Colors.grey), // Default style
                      children: [
                        const TextSpan(
                          text: '\u2022 Builtup Area: ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: widget.builtUpArea,
                        ),
                        const TextSpan(
                          text: '\n',
                        ),
                        const TextSpan(
                          text: '\u2022 Lot Size: ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: widget.lotSize,
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    color: Colors.grey,
                  ),
                  const SizedBox(height: 4),
                  Center(
                    child: Column(
                      children: [
                        Text(
                          widget.auctionStatus,
                          style: TextStyle(
                            color: widget.auctionStatus == 'Auction is live'
                                ? Colors.green
                                : ATColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 15),
                        if (widget.auctionStatus == 'Auction is live')
                          Text.rich(
                            TextSpan(
                              children: [
                                const TextSpan(
                                  text: 'Current Highest Bid : ',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                                TextSpan(
                                  text: widget.currentBid,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
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
            ),
          ],
        ),
      ),
    );
  }
}
