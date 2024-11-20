import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:petmate/Controller/weather_controller.dart';
import 'package:petmate/Widget/main/walk/walk_timer.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class WalkLog extends StatefulWidget {
  const WalkLog({super.key});

  @override
  State<WalkLog> createState() => _WalkLogState();
}

class _WalkLogState extends State<WalkLog> {
  WeatherController weatherController = Get.put(WeatherController());
  NaverMapController? _mapController;
  final StopWatchTimer _stopWatchTimer = StopWatchTimer();

  final cameraPosition = NCameraPosition(
    target: NLatLng(37.2408, 127.0297),
    zoom: 15,
    bearing: 0,
    tilt: 0,
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    weatherController.fetchLocationName();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          NaverMap(
            options: NaverMapViewOptions(
              locationButtonEnable: true,
              initialCameraPosition: cameraPosition,
              pickTolerance: 8,
            ),
            onMapReady: (controller) {
              _mapController = controller;
            },
          ),
          Positioned(
              top: 44,
              left: 12,
              child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Image.asset('assets/image_asset/walk_log/Left.png'))),
          Positioned(
              child: Image.asset('assets/image_asset/walk_log/Image.png')),
          Positioned(bottom: 0.h, left: 0.w, child: WalkTimer())
        ],
      ),
    );
  }
}
