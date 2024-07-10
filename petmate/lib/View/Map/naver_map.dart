import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:petmate/Controller/navigation_controller.dart';
import 'package:petmate/Widget/bottom_navigation_bar/map_bottom_navigation.dart';
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

class _MNaverMapState extends State<MNaverMap> {
  final BottomNavigationBarController _bottomNavigationBarController =
      Get.put(BottomNavigationBarController());
  late NaverMapController _mapController;
  late NOverlayImage markerIcon;
  late Position _currentPosition;

  bool _showLocationSearch = false;

  final cameraPosition = NCameraPosition(
    target: NLatLng(37.4968083, 127.06319),
    zoom: 15,
    bearing: 0,
    tilt: 0,
  );

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    markerIcon = NOverlayImage.fromAssetImage('assets/mapimg/mylocation.png');
  }

  Future<void> _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      setState(() {
        _currentPosition = position;

        print('현재 위치: ${_currentPosition}');
      });
    } catch (e) {
      print('Error while fetching location: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: GestureDetector(
        onTap: () {
          setState(() {
            _showLocationSearch = false;
          });
        },
        child: Container(
          height: 800.h,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              NaverMap(
                options: NaverMapViewOptions(
                  initialCameraPosition: cameraPosition,
                ),
                onMapReady: (controller) {
                  _mapController = controller;
                  final marker = NMarker(
                    icon: markerIcon,
                    id: 'test',
                    position: NLatLng(
                        _currentPosition.latitude, _currentPosition.longitude),
                  );
                  _mapController.clearOverlays();
                  _mapController.addOverlay(marker);
                },
              ),
              Positioned(left: 8.w, top: 54.h, child: MapSearchBar()),
              Positioned(
                top: 110.h,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        HospitalWidget(),
                        SizedBox(
                          width: 8.w,
                        ),
                        RestaurantWidget(),
                        SizedBox(
                          width: 8.w,
                        ),
                        ParkWidget(),
                        SizedBox(
                          width: 8.w,
                        ),
                        HairShop(),
                        SizedBox(
                          width: 8.w,
                        ),
                        PetShopWidget(),
                        SizedBox(
                          width: 8.w,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Visibility(
                  visible: _showLocationSearch,
                  child: Positioned(
                      right: 110, bottom: 75, child: LocationSearch())),
              Positioned(
                  right: 10,
                  bottom: 75,
                  child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _showLocationSearch = true;
                          _getCurrentLocation();
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
