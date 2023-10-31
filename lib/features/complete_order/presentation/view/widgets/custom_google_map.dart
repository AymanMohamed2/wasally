import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:wasally/core/constants.dart';
import 'package:wasally/core/utils/size_config.dart';
import 'package:wasally/core/widgets/custom_elevated_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get/get.dart' hide Trans;

import '../../../../../core/utils/app_strings.dart';
import 'custom_google_map_body.dart';

class CustomGoogleMap extends StatefulWidget {
  const CustomGoogleMap({
    Key? key,
    required this.locationData,
  }) : super(key: key);
  final LocationData locationData;

  @override
  // ignore: library_private_types_in_public_api
  _CustomGoogleMapState createState() => _CustomGoogleMapState();
}

class _CustomGoogleMapState extends State<CustomGoogleMap> {
  @override
  void initState() {
    getLocation();
    super.initState();
  }

  Future<void> getLocation() async {
    _markers.add(Marker(
      markerId: const MarkerId("2"),
      position:
          LatLng(widget.locationData.latitude!, widget.locationData.longitude!),
      infoWindow: const InfoWindow(
        title: 'My Current Location',
      ),
    ));

    CameraPosition cameraPosition = CameraPosition(
      target:
          LatLng(widget.locationData.latitude!, widget.locationData.longitude!),
      zoom: 14,
    );

    final GoogleMapController controller = await _controller.future;
    await controller
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));

    setState(() {});
  }

  final Completer<GoogleMapController> _controller = Completer();
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: Text(
            AppStrings.getLocation.tr(),
            style: const TextStyle(color: Colors.black),
          ),
        ),
        // ignore: avoid_unnecessary_containers
        body: CustomGoogleMapBody(
            kGoogle: _kGoogle, markers: _markers, controller: _controller),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              width: SizeConfig.screenWidth! * 0.9,
              child: CustomElevatedButton(
                onPressed: () async {
                  Get.back();
                },
                child: Text(
                  AppStrings.determineMyCurrent.tr(),
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
