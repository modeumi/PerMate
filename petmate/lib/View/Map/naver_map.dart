import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';

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
  late NaverMapController _mapController;

  final cameraPosition = NCameraPosition(
    target: NLatLng(37.5666102, 126.9783881),
    zoom: 15,
    bearing: 0,
    tilt: 0,
  );

  //   Future<void> _searchLocation()async{
  //   try {
  //     Position position = await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.high,
  //     );
  //     _mapController.moveCamera(
  //       CameraUpdate.newCameraPosition(NCameraPosition(target: position.latitude, position.longitude, zoom: 15))
  //     )
  //   } catch (e) {

  //   }
  // }

  // Map<String, dynamic> hospotal = {
  //   'A병원': {'name:병원'}
  // };
  // final marker1 = NMarker(id: '병원', position: NLatLng(37.2408, 127.0297));

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            NaverMap(
              options: NaverMapViewOptions(
                  initialCameraPosition: cameraPosition,
                  pickTolerance: 8,
                  locationButtonEnable: true),
              onMapReady: (controller) {
                setState(() {
                  _mapController = controller;
                });
              },
            ),
            MapSearchBar(),
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Container(
                height: 50,
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
            Positioned(left: 100, bottom: 40, child: LocationSearch()),
            Positioned(right: 20, bottom: 40, child: LocationWidget()),
          ],
        ),
      ),
    );
  }
}
