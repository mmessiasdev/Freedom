import 'package:flutter/material.dart';
import 'package:Freedom/component/header.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        MainHeader(),
        Expanded(
          child: GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(46.811398, -71.204221),
              zoom: 18,
            ),
          ),
        ),
      ],
    ));
  }
}
