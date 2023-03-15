import 'dart:ui';

import 'package:Freedom/view/account/account_screen.dart';
import 'package:flutter/material.dart';
import 'package:Freedom/component/header.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../component/colors.dart';
import '../../component/texts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        const MainHeader(),
        Expanded(
          child: Stack(
            children: [
              Expanded(
                child: GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: LatLng(46.811398, -71.204221),
                    zoom: 18,
                  ),
                ),
              ),
              Container(
                height: 130,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Colors.white,
                      Colors.white,
                      Color.fromARGB(0, 255, 255, 255)
                    ])),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Stack(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: Column(
                            children: [
                              PrimaryText(
                                text: 'Mapa',
                                color: TerciaryColor,
                                align: TextAlign.center,
                              ),
                              SubText(
                                  text:
                                      'Saiba tudo o que acontece \n e onde acontece.',
                                  color: OffColor,
                                  align: TextAlign.center)
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Align(
                          alignment: Alignment.topRight,
                          child: SizedBox(
                            height: 60,
                            child: GestureDetector(
                              child: CircleAvatar(
                                backgroundColor: TerciaryColor,
                                child: Icon(
                                  Icons.person,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AccountScreen(),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
