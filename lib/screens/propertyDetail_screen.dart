import 'dart:ui';
import 'package:flutter/material.dart';
import '../data/property_card_data.dart';
import 'widgets/propertyCard.dart';
import 'widgets/propertyDetail_screen_widget.dart';
import 'widgets/property_details_widgets/emi_calculator.dart';
import 'widgets/property_details_widgets/enquire_now_button.dart';
import 'widgets/property_details_widgets/fees_and_commission.dart';
import 'widgets/property_details_widgets/map_integration.dart';
import 'widgets/property_details_widgets/order_reports.dart';
import 'widgets/property_details_widgets/property_description.dart';

class PropertyDetailScreen extends StatefulWidget {
  final List<String> imagePaths;
  final String title;
  final String id;
  final String address;
  final String auctionStatus;
  final String latitude;
  final String longitude;
  final String description;
  final int propertyIndex;
  final String title4;
  final String subtitleFC;
  final String subtitle2FC;
  final String subtitle3FC;
  final String subtitle4FC;
  final String trailingFC;
  final String trailing2FC;
  final String trailing3FC;
  final String trailing4FC;

  const PropertyDetailScreen({
    Key? key,
    required this.title,
    required this.id,
    required this.address,
    required this.imagePaths,
    required this.auctionStatus,
    required this.latitude,
    required this.longitude,
    required this.description,
    required this.propertyIndex,
    required this.title4,
    required this.subtitleFC,
    required this.subtitle2FC,
    required this.subtitle3FC,
    required this.subtitle4FC,
    required this.trailingFC,
    required this.trailing2FC,
    required this.trailing3FC,
    required this.trailing4FC,
  }) : super(key: key);

  @override
  State<PropertyDetailScreen> createState() => _PropertyDetailScreenState();
}

class _PropertyDetailScreenState extends State<PropertyDetailScreen> {
  late PageController _pageController;
  List<bool> isSelected = [true, false, false, false];
  int selectedIndex = 0;
  List<Map<String, dynamic>> leftColumnData = [];
  List<Map<String, dynamic>> rightColumnData = [];

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
    leftColumnData = [
      {'icon': Icons.person, 'title': 'Listed By', 'value': Properties[widget.propertyIndex]['listedBy']},
      {'icon': Icons.attach_money_rounded, 'title': 'Starting Bid', 'value': Properties[widget.propertyIndex]['startingBid']},
      {'icon': Icons.landscape_rounded, 'title': 'Lot Size\n(Unit in Acres)', 'value': Properties[widget.propertyIndex]['lotSize2']},
      {'icon': Icons.business, 'title': 'Property Type', 'value': Properties[widget.propertyIndex]['propertyType']},
      {'icon': Icons.engineering, 'title': 'Builder Name', 'value': Properties[widget.propertyIndex]['BuilderName']},
      {'icon': Icons.home, 'title': 'Property \nTotal No of Floor', 'value': Properties[widget.propertyIndex]['totalFloor']},
      {'icon': Icons.layers, 'title': 'Property On Floor', 'value': Properties[widget.propertyIndex]['propertyFloor']},
      {'icon': Icons.today, 'title': 'Possesion Time \n(In Days)', 'value': Properties[widget.propertyIndex]['PossesionTime']},
      {'icon': Icons.gavel, 'title': 'Accepts Buyers Title', 'value': Properties[widget.propertyIndex]['AcceptBuyersTitle']},
    ];

    rightColumnData = [
      {'icon': Icons.calendar_today_outlined, 'title': 'Property \nBuilt year', 'value': Properties[widget.propertyIndex]['PropertyBuiltYear']},
      {'icon': Icons.account_circle_rounded, 'title': 'Architech Name', 'value': Properties[widget.propertyIndex]['ArchitextName']},
      {'icon': Icons.square_foot_rounded, 'title': 'Builtup Area\n(Unit in Sqft)', 'value': Properties[widget.propertyIndex]['BuiltupArea']},
      {'icon': Icons.local_parking_rounded, 'title': 'Car Parking', 'value': Properties[widget.propertyIndex]['CarParking']},
      {'icon': Icons.credit_card, 'title': 'Property Tax ID', 'value': Properties[widget.propertyIndex]['PropertyTaxID']},
      {'icon': Icons.domain, 'title': 'Asset Type', 'value': Properties[widget.propertyIndex]['AssetType']},
      {'icon': Icons.crop_square, 'title': 'Rentable \n(Unit in Sqft)', 'value': Properties[widget.propertyIndex]['Rentable']},
      {'icon': Icons.door_front_door_outlined, 'title': 'Interior Access', 'value': Properties[widget.propertyIndex]['InteriorAccess']},
      {'icon': Icons.person, 'title': 'Ownership', 'value': Properties[widget.propertyIndex]['Ownership']},
    ];
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('Property Index: ${widget.propertyIndex}');
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 38.0, bottom: 80),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.55,
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: widget.imagePaths.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Stack(
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 17.0, vertical: 15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30.0),
                                child: Image.asset(
                                  widget.imagePaths[index],
                                  fit: BoxFit.cover,
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 30,
                              top: 30,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.2),
                                        spreadRadius: 1,
                                        blurRadius: 3,
                                        offset: const Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: const Icon(
                                    Icons.arrow_back_rounded,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 30,
                              right: 30,
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Text(
                                  widget.auctionStatus,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          widget.id,
                          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                        ),
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                widget.address,
                                style: TextStyle(fontSize: 15, color: Colors.grey[600]),
                                softWrap: true,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(14, 10, 14, 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            PropertyDetailsWidget(propertyData: leftColumnData),
                            const SizedBox(width: 20),
                            PropertyDetailsWidget(propertyData: rightColumnData),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        double buttonWidth = (constraints.maxWidth - 30) / 4;
                        return ToggleButtons(
                          borderRadius: BorderRadius.circular(12),
                          isSelected: isSelected,
                          onPressed: (int index) {
                            setState(() {
                              for (int buttonIndex = 0; buttonIndex < isSelected.length; buttonIndex++) {
                                isSelected[buttonIndex] = (buttonIndex == index);
                              }
                              selectedIndex = index;
                            });
                          },
                          fillColor: const Color(0xFFCA996E),
                          selectedColor: Colors.white,
                          color: const Color(0xFFCA996E),
                          children: [
                            Container(
                              width: buttonWidth,
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: const Text('Property Description', textAlign: TextAlign.center),
                            ),
                            Container(
                              width: buttonWidth,
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: const Text('Fees & Commission', textAlign: TextAlign.center),
                            ),
                            Container(
                              width: buttonWidth,
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: const Text('Order Reports', textAlign: TextAlign.center),
                            ),
                            Container(
                              width: buttonWidth,
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: const Text('EMI Calculator', textAlign: TextAlign.center),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: _buildContent(selectedIndex),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 5, 16, 10),
                    child: MapIntegration(
                      latitude: double.parse(widget.latitude),
                      longitude: double.parse(widget.longitude),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Positioned(
            left: 20,
            right: 20,
            bottom: 20, // Adjust as needed
            child: EnquireNowButton(),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(int index) {
    switch (index) {
      case 0:
        return PropertyDescription(description: widget.description,);
      case 1:
        return FeesCommission(title4: widget.title4, subtitleFC: widget.subtitleFC, subtitle2FC: widget.subtitle2FC, subtitle3FC: widget.subtitle3FC, subtitle4FC: widget.subtitle4FC, trailingFC: widget.trailingFC, trailing2FC: widget.trailing2FC, trailing3FC: widget.trailing3FC, trailing4FC: widget.trailing4FC,);
      case 2:
        return const OrderReports();
      case 3:
        return const EmiCalculatorCard();
      default:
        return const Text('Select an option');
    }
  }
}
