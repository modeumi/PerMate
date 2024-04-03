// import 'package:flutter/material.dart';

// class MapPage extends StatefulWidget {
//   const MapPage({super.key});

//   @override
//   State<MapPage> createState() => _MapPageState();
// }

// class _MapPageState extends State<MapPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 8.0),
//       child: Stack(
//         children: [
//           Container(
//             width: widget.width,
//             height: widget.height,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20), color: Colors.white),
//           ),
//           Container(
//             width: widget.width,
//             height: widget.height,
//             padding: const EdgeInsets.fromLTRB(8, 6, 16, 6),
//             decoration: BoxDecoration(
//               color: widget.color,
//               borderRadius: BorderRadius.circular(30),
//               boxShadow: [
//                 BoxShadow(
//                     color: Color(0x3F000000),
//                     blurRadius: 4,
//                     offset: Offset(0, 2),
//                     spreadRadius: 0),
//               ],
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Container(
//                   width: 28,
//                   height: 28,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: Image.asset(
//                     widget.iconPath,
//                     width: 28,
//                     height: 28,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             width: widget.width,
//             height: widget.height,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//                 color: Colors.white.withOpacity(0.1)),
//           ),
//           Positioned(
//             left: 42,
//             top: 9,
//             child: Text(
//               widget.label,
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 16,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }