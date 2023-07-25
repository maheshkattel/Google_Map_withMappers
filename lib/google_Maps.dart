import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMaps extends StatefulWidget {
  const GoogleMaps({super.key});

  @override
  State<GoogleMaps> createState() => _GoogleMapsState();
}

class _GoogleMapsState extends State<GoogleMaps> {
  List<Marker> marker = <Marker>[];

  getMarkers() {
    for (int i = 10; i <= 50; i = i + 10) {
      marker.add(Marker(
          markerId: MarkerId('1'),
          position: LatLng(26.4525, 87.2718 - i),
          infoWindow: InfoWindow(title: 'Hello')));
    }
  }

  final Completer<GoogleMapController> _completer =
      Completer<GoogleMapController>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMarkers();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          // bearing: 19.8334901395799,
          target: LatLng(26.4525, 87.2718),
          tilt: 59.440717697143555,
          zoom: 1,
        ),
        markers: Set<Marker>.of(marker),
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController controller) {
          _completer.complete(controller);
        },
      ),
    );
  }
}
