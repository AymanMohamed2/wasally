import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wasally/core/constants.dart';
import 'package:wasally/core/utils/size_config.dart';
import 'package:wasally/core/widgets/custom_elevated_button.dart';
import 'package:wasally/core/widgets/space_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get/get.dart' hide Trans;
import 'package:wasally/features/home/presentation/manager/complete_order_get_location_cubit/complete_order_get_location_cubit.dart';

import '../../../../../core/utils/app_strings.dart';

class CustomGoogleMap extends StatefulWidget {
  const CustomGoogleMap({
    Key? key,
  }) : super(key: key);

  @override
  _CustomGoogleMapState createState() => _CustomGoogleMapState();
}

class _CustomGoogleMapState extends State<CustomGoogleMap> {
  Completer<GoogleMapController> _controller = Completer();
// on below line we have specified camera position
  static final CameraPosition _kGoogle = const CameraPosition(
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
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              width: SizeConfig.screenWidth! * 0.7,
              child: CustomElevatedButton(
                onPressed: position != null
                    ? () {
                        Get.back();
                      }
                    : null,
                child: Text(
                  AppStrings.determineMyCurrent.tr(),
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            ),
            const HorizintalSpace(2),
            FloatingActionButton(
              backgroundColor: Colors.orange,
              onPressed: () async {
                await accessCubitLocation
                    .getUserCurrentLocation()
                    .then((value) async {
                  position = value;
                  print(position);

                  _markers.add(Marker(
                    markerId: const MarkerId("2"),
                    position: LatLng(value.latitude, value.longitude),
                    infoWindow: const InfoWindow(
                      title: 'My Current Location',
                    ),
                  ));

                  CameraPosition cameraPosition = new CameraPosition(
                    target: LatLng(value.latitude, value.longitude),
                    zoom: 14,
                  );

                  final GoogleMapController controller =
                      await _controller.future;
                  await controller.animateCamera(
                      CameraUpdate.newCameraPosition(cameraPosition));

                  setState(() {});
                });
              },
              child: const Icon(
                Icons.location_pin,
                color: Colors.black,
              ),
            ),
            VirticalSpace(10)
          ],
        ),
      ),
    );
  }
}
