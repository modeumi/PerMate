import 'package:flutter/material.dart';
import 'package:petmate/data/mylocation.dart';
import 'package:geolocator/geolocator.dart';

class LocationWidget extends StatefulWidget {
  const LocationWidget({super.key});

  @override
  State<LocationWidget> createState() => _LocationWidgetState();
}

class _LocationWidgetState extends State<LocationWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 40,
        height: 40,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1,
              color: Colors.white.withOpacity(0.20000000298023224),
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          shadows: [
            BoxShadow(
              color: Color(0x26000000),
              blurRadius: 2,
              offset: Offset(2, 2),
              spreadRadius: 0,
            )
          ],
        ),
        child: Image.asset('assets/mapimg/icon (3).png'));
  }
}
