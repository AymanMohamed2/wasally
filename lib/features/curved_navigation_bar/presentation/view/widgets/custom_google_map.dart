import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wasally/core/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:wasally/features/home/presentation/manager/complete_order_get_location_cubit/complete_order_get_location_cubit.dart';

import '../../../../../core/utils/app_strings.dart';

class CustomGoogleMap extends StatefulWidget {
  const CustomGoogleMap({
    Key? key,
    required this.latitude,
    required this.longtude,
  }) : super(key: key);
  final double latitude;
  final double longtude;

  @override
  _CustomGoogleMapState createState() => _CustomGoogleMapState();
}

class _CustomGoogleMapState extends State<CustomGoogleMap> {
  final Completer<GoogleMapController> _controller = Completer();
  Future<void> getLocation() async {
    _markers.add(Marker(
      markerId: const MarkerId("2"),
      position: LatLng(widget.latitude, widget.longtude),
      infoWindow: const InfoWindow(
        title: 'My Current Location',
      ),
    ));

    CameraPosition cameraPosition = CameraPosition(
      target: LatLng(widget.latitude, widget.longtude),
      zoom: 14,
    );

    final GoogleMapController controller = await _controller.future;
    await controller
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getLocation();
  }

// on below line we have specified camera position
  static const CameraPosition _kGoogle = CameraPosition(
    target: LatLng(20.42796133580664, 80.885749655962),
    zoom: 14.4746,
  );

  final List<Marker> _markers = <Marker>[
    const Marker(
        markerId: MarkerId('1'),
        position: LatLng(20.42796133580664, 75.885749655962),
        infoWindow: InfoWindow(
          title: 'My Position',
        )),
  ];

  Position? position;
  @override
  Widget build(BuildContext context) {
    var accessCubitLocation =
        BlocProvider.of<CompleteOrderGetLocationCubit>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: Text(
            AppStrings.getLocation.tr(),
            style: const TextStyle(color: Colors.black),
          ),
        ),
        body: Container(
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
        ),
      ),
    );
  }
}
