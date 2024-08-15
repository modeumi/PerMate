import 'package:flutter/material.dart';

class BlueContainer extends StatelessWidget {
  final double width;
  final double height;

  const BlueContainer({
    super.key,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        decoration: ShapeDecoration(
          color: Color(0x9900287C),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1,
              color: Colors.white.withOpacity(0.20000000298023224),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          shadows: [
            BoxShadow(
              color: Color(0x26000000),
              blurRadius: 2,
              offset: Offset(2, 2),
              spreadRadius: 0,
            )
          ],
        ));
  }
}
