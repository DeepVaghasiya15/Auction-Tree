import 'package:flutter/material.dart';

class ServicesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Column(
            children: [
              TabBar(
                tabs: [
                  Tab(text: 'Service List'),
                  Tab(text: 'Service Provider'),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Center(
                      child: Text('Data will be attched soon'),
                    ),
                    Center(
                      child: Text('Data will be attched soon'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
