// import 'dart:convert';
// import 'dart:html';

// import 'package:flutter/material.dart';
// import 'package:flutter_naver_map/flutter_naver_map.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:petmate/View/Map/Map.dart';
// import 'package:petmate/View/Map/map_serachbar.dart';

// class MNaverMap extends StatefulWidget {
//   const MNaverMap({super.key});

//   @override
//   State<MNaverMap> createState() => _MNaverMapState();
// }

// class _MNaverMapState extends State<MNaverMap> {
//   late NaverMapController _mapController;
//   // Map<String, dynamic> hospotal = {
//   //   'A병원': {'name:병원'}
//   // };
//   final marker1 = NMarker(id: '병원', position: NLatLng(37.2408, 127.0297));
//   final marker2 = NMarker(id: '식당', position: NLatLng(37.3229, 127.0469));
//   final marker3 = NMarker(id: '공원', position: NLatLng(37.2875, 127.0784));
//   final marker4 = NMarker(id: '미용실', position: NLatLng(37.2472, 127.0414));
//   final marker5 = NMarker(id: '애완용품샵', position: NLatLng(37.2149, 127.0538));
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: Stack(
//           children: [
//             NaverMap(
//               options: const NaverMapViewOptions(
//                 // extent: NLatLngBounds(
//                 //     southWest: NLatLng(31.43, 122.37),
//                 //     northEast: NLatLng(44.35, 132.0)),
//                 initialCameraPosition: NCameraPosition(
//                   target: NLatLng(37.5666, 126.979),
//                   zoom: 10,
//                   bearing: 0,
//                   tilt: 0,
//                 ),
//                 zoomGesturesEnable: true,
//                 mapType: NMapType.basic,
//                 activeLayerGroups: [NLayerGroup.building, NLayerGroup.transit],
//               ),
//               onMapReady: (controller) async {
//                 addMakers(controller);
//                 _mapController = controller;
//                 // print("네이버 맵 로딩됨!");
//               },
//             ),
//             MapSearchBar(
//               onSearch: _searchLocation,
//             ),
//             MapPage()
//           ],
//         ),
//       ),
//     );
//   }

//   void addMakers(NaverMapController controller) {
//     // for (var data in markerData) {
//     //   final marker = NMarker(id: data, position: data['position'] as NLatLng);
//     //   controller.
//     // }
//   }
// }

// Future<void> _searchLocation(String query) async {
//   try {
//     List<Location> locations = await locationFormAddress(query);
//     if (locations.isNotEmpty) {
//       _moveToLocation(locations.first);
//     } else {
//       print('not : $query');
//     }
//   } catch (e) {
//     print('Error : $e');
//   }
// }

// void _moveToLocation(Location location) {
//   _mapController.moveCamera(
//     CamerUpdate.newLatLang(NLatLng(location.latitude, location.logitude))
//   );
// }
