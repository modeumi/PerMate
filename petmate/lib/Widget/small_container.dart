import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glass_kit/glass_kit.dart';

class SmallContainer extends StatelessWidget {
  final double width;
  final double height;
  const SmallContainer(
      {super.key, this.width = double.infinity, this.height = double.infinity});

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      width: width,
      height: height,
      color: Color(0x3300287C),
      gradient: LinearGradient(
        colors: [
          Colors.transparent,
          Colors.white.withOpacity(0.2),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderGradient: LinearGradient(
        colors: [
          Colors.white.withOpacity(0.5),
          Colors.white.withOpacity(0.2),
          Colors.white.withOpacity(0.2),
          Colors.white.withOpacity(0.2),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: [0.10, 0.30, 0.20, 0.0],
      ),
      blur: 12,
      borderRadius: BorderRadius.circular(10.r),
      borderWidth: 1.0,
      elevation: 0,
    );
  }
}
