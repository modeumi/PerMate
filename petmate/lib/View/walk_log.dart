import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:petmate/Widget/main/walk/walk_timer.dart';
import 'package:petmate/Widget/small_container.dart';

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
              Positioned(bottom: 0.h, left: 0.w, child: WalkTimer())
            ],
          ),
        ),
      ),
    );
  }
}
