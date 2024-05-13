import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:petmate/Controller/navigation_controller.dart';
import 'package:petmate/Widget/bottom_bar/bottom_navigationbar.dart';
import 'package:petmate/Widget/bottom_bar/map_bottom_navigation.dart';

import 'package:petmate/Widget/map/location_search.dart';
import 'package:petmate/Widget/map/hairshop.dart';
import 'package:petmate/Widget/map/location.dart';
import 'package:petmate/Widget/map/map_serachbar.dart';
import 'package:petmate/Widget/map/hospital.dart';
import 'package:petmate/Widget/map/park.dart';
import 'package:petmate/Widget/map/petshop.dart';
import 'package:petmate/Widget/map/restaurant.dart';

class MNaverMap extends StatefulWidget {
  const MNaverMap({super.key});

  @override
  State<MNaverMap> createState() => _MNaverMapState();
}

Future<Position> getCurrentLocation() async {
  Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);
  return position;
}

class _MNaverMapState extends State<MNaverMap> {
  final BottomNavigationBarController _bottomNavigationBarController =
      Get.put(BottomNavigationBarController());
  late NaverMapController _mapController;
  bool _showLocationSearch = false;

  final cameraPosition = NCameraPosition(
    target: NLatLng(37.2408, 127.0297),
    zoom: 15,
    bearing: 0,
    tilt: 0,
  );

  // Map<String, dynamic> hospotal = {
  //   'A병원': {'name:병원'}
  // };
  // final marker = NMarker(id: '병원', position: NLatLng(37.2408, 127.0297));

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          setState(() {
            _showLocationSearch = false;
          });
        },
        child: Container(
          height: 800,
          child: Stack(
            children: [
              NaverMap(
                options: NaverMapViewOptions(
                  initialCameraPosition: cameraPosition,
                  pickTolerance: 8,
                ),
                onMapReady: (controller) {
                  setState(() {
                    _mapController = controller;
                  });
                },
              ),
              MapSearchBar(),
              Padding(
                padding: const EdgeInsets.only(top: 90),
                child: Container(
                  height: 55,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Row(
                        children: [
                          HospitalWidget(),
                          RestaurantWidget(),
                          ParkWidget(),
                          HairShop(),
                          PetShopWidget(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Visibility(
                  visible: _showLocationSearch = !_showLocationSearch,
                  child: Positioned(
                      right: 110, bottom: 75, child: LocationSearch())),
              Positioned(
                  right: 10,
                  bottom: 75,
                  child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _showLocationSearch = true;
                        });
                      },
                      child: LocationWidget())),
            ],
          ),
        ),
      ),
      bottomSheet: MapBottomNavigationBar(),
    );
  }
}
