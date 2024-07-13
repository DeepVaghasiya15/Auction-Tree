import 'dart:ui';
import 'package:flutter/material.dart';
import '../data/propertyDetail_screen_data.dart';
import 'widgets/propertyCard.dart';
import 'widgets/propertyDetail_screen_widget.dart';
import 'widgets/property_details_widgets/emi_calculator.dart';
import 'widgets/property_details_widgets/enquire_now_button.dart';
import 'widgets/property_details_widgets/fees_and_commission.dart';
import 'widgets/property_details_widgets/map_integration.dart';
import 'widgets/property_details_widgets/order_reports.dart';
import 'widgets/property_details_widgets/property_description.dart';

class PropertyDetailScreen extends StatefulWidget {
  const PropertyDetailScreen({Key? key}) : super(key: key);

  @override
  State<PropertyDetailScreen> createState() => _PropertyDetailScreenState();
}

class _PropertyDetailScreenState extends State<PropertyDetailScreen> {
  late PageController _pageController;
  List<bool> isSelected = [true, false, false, false];
  int selectedIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 38.0,bottom: 80),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.55,
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: imagePaths.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Stack(
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 17.0, vertical: 15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30.0),
                                child: Image.asset(
                                  imagePaths[index],
                                  fit: BoxFit.cover,
                                  width: MediaQuery.of(context)
                                      .size
                                      .width, // Full width of the screen
                                  height: MediaQuery.of(context).size.height,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 30,
                              top: 30,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pop(); // Replace with your navigation logic
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
                                        offset: const Offset(0, 2), // changes position of shadow
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
                                child: const Text(
                                  'Auction Coming Soon ',
                                  style: TextStyle(
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
                        const Text(
                          'Perfect Plaza',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          'ID: PROP240611285',
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                        ),
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                'New York St, New York, NY 10001, United States',
                                style:
                                TextStyle(fontSize: 15, color: Colors.grey[600]),
                                softWrap: true,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16,right: 16),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(14, 10, 14, 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
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
                    padding: const EdgeInsets.only(left: 20),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        double buttonWidth = (constraints.maxWidth - 30) / 4;
                        return ToggleButtons(
                          borderRadius: BorderRadius.circular(12),
                          isSelected: isSelected,
                          onPressed: (int index) {
                            setState(() {
                              for (int buttonIndex = 0;
                              buttonIndex < isSelected.length;
                              buttonIndex++) {
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
                              child: const Text('Property Description',
                                  textAlign: TextAlign.center),
                            ),
                            Container(
                              width: buttonWidth,
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: const Text('Fees & Commission',
                                  textAlign: TextAlign.center),
                            ),
                            Container(
                              width: buttonWidth,
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: const Text('Order Reports',
                                  textAlign: TextAlign.center),
                            ),
                            Container(
                              width: buttonWidth,
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: const Text('EMI Calculator',
                                  textAlign: TextAlign.center),
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
                  const Padding(
                      padding: EdgeInsets.fromLTRB(16.0,5,16,10),
                      child: MapIntegration()
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(16,20,16,20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Similar Properties", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24,),textAlign: TextAlign.left,),
                        PropertyCard(
                          imageAssetPath: 'assets/images/commercialPlaza.jpg',
                          type: 'Commercial Plaza',
                          title: 'My Plaza',
                          address: 'Florida A1A, Miami, FL 33125, United States',
                          builtUpArea: '10,000 sqft',
                          lotSize: '2 Acres',
                        ),
                        SizedBox(height: 10,),
                        PropertyCard(
                          imageAssetPath: 'assets/images/megmaCommercial.webp',
                          type: 'Hotel',
                          title: 'Megma',
                          address: "Indira Gandhi Int'l T3 Rd, Delhi, DL 110037, India",
                          builtUpArea: '150,000 sqft',
                          lotSize: '30 Acres',
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
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
        return const PropertyDescription();
      case 1:
        return const FeesCommission();
      case 2:
        return const OrderReports();
      case 3:
        return const EmiCalculatorCard();
      default:
        return const Text('Select an option');
    }
  }
}
