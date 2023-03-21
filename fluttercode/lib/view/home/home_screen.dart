import 'package:Freedom/controller/map.dart';
import 'package:Freedom/model/locals.dart';
import 'package:Freedom/service/remote_service/local_service.dart';
import 'package:flutter/material.dart';
import 'package:Freedom/component/header.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../component/colors.dart';
import '../../component/texts.dart';
import '../account/account_screen.dart';


class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controllerMap = Get.put(MapController());
  Attributes? data;

  @override
  Widget build(BuildContext context) {
    controllerMap.getPosition();

    return SafeArea(
        child: Column(
      children: [
        const MainHeader(),
        Expanded(
          child: Stack(
            children: [
              Expanded(
                child: GetBuilder<MapController>(
                  init: controllerMap,
                  builder: (value) => GoogleMap(
                    onMapCreated: controllerMap.onMapCreated,
                    initialCameraPosition: CameraPosition(
                      target: LatLng(controllerMap.lat.toDouble(),
                          controllerMap.long.toDouble()),
                      zoom: 13,
                    ),
                    myLocationEnabled: true,
                  ),
                ),
              ),
              Container(
                height: 200,
                decoration: const BoxDecoration(
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
                                  align: TextAlign.center),
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
                              // onTap: () {
                              //   getLocalList();
                              //   print(getLocalList());
                              // },
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
