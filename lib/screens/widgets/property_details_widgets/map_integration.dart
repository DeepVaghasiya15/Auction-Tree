import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapIntegration extends StatefulWidget {
  final double latitude;
  final double longitude;

  const MapIntegration({
    Key? key,
    required this.latitude,
    required this.longitude,
  }) : super(key: key);

  @override
  State<MapIntegration> createState() => _MapIntegrationState();
}

class _MapIntegrationState extends State<MapIntegration> {
  late GoogleMapController _mapController;
  late LatLng _center;

  @override
  void initState() {
    super.initState();
    _center = LatLng(widget.latitude, widget.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: SizedBox(
        height: 300,
        child: GoogleMap(
          onMapCreated: (GoogleMapController controller) {
            _mapController = controller;
          },
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 15.0,
          ),
          markers: {
            Marker(
              markerId: const MarkerId('property_location'),
              position: _center,
              infoWindow: InfoWindow(
                title: 'Property Location',
                snippet: 'Coordinates: ${_center.latitude}, ${_center.longitude}',
              ),
            ),
          },
        ),
      ),
    );
  }
}
