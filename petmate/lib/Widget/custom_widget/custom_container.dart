import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';

class CustomContainer extends StatelessWidget {
  final double? width;
  final double? height;
  final Color shadow_color;
  final Color color;
  const CustomContainer(
      {super.key,
      this.width,
      this.height,
      required this.shadow_color,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      width: width ?? double.infinity,
      height: height ?? double.infinity,
      color: color,
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
        stops: [0.10, 0.30, 0.40, 0.0],
      ),
      blur: 12,
      borderRadius: BorderRadius.circular(10),
      borderWidth: 1.0,
      elevation: 0,
      boxShadow: [
        BoxShadow(
          color: shadow_color,
          blurRadius: 10,
          offset: Offset(2, 2),
          spreadRadius: 0,
        )
      ],
    );
  }
}
