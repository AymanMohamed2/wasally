import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomGoogleMapBody extends StatelessWidget {
  const CustomGoogleMapBody({
    super.key,
    required CameraPosition kGoogle,
    required List<Marker> markers,
    required Completer<GoogleMapController> controller,
  })  : _kGoogle = kGoogle,
        _markers = markers,
        _controller = controller;

  final CameraPosition _kGoogle;
  final List<Marker> _markers;
  final Completer<GoogleMapController> _controller;

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: SafeArea(
        child: GoogleMap(
          zoomControlsEnabled: false,
          myLocationButtonEnabled: false,
          mapToolbarEnabled: false,
          initialCameraPosition: _kGoogle,
          markers: Set<Marker>.of(_markers),
          mapType: MapType.normal,
          myLocationEnabled: true,
          compassEnabled: true,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
      ),
    );
  }
}
