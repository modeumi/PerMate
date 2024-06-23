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
import 'package:petmate/Widget/bottom_navigation_bar/bottom_navigationbar.dart';
import 'package:petmate/Widget/bottom_navigation_bar/map_bottom_navigation.dart';

import 'package:petmate/Widget/map/location_search.dart';
import 'package:petmate/Widget/map/hairshop.dart';
import 'package:petmate/Widget/map/location.dart';
import 'package:petmate/Widget/map/map_serachbar.dart';
import 'package:petmate/Widget/map/hospital.dart';
import 'package:petmate/Widget/map/park.dart';
import 'package:petmate/Widget/map/petshop.dart';
import 'package:petmate/Widget/map/restaurant.dart';

class WalkLog extends StatefulWidget {
  const WalkLog({super.key});

  @override
  State<WalkLog> createState() => _WalkLogState();
}

Future<Position> getCurrentLocation() async {
  Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);
  return position;
}

class _WalkLogState extends State<WalkLog> {
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
              Positioned(
                  top: 44,
                  left: 12,
                  child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child:
                          Image.asset('assets/image_asset/walk_log/Left.png'))),
            ],
          ),
        ),
      ),
    );
  }
}
