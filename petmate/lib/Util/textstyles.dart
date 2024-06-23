import 'package:flutter/material.dart';

TextStyle Black(double size, FontWeight weight) {
  return TextStyle(
      fontSize: size,
      fontWeight: weight,
      color: const Color(0xFF303030),
      fontFamily: 'Pretendard');
}

TextStyle White(double size, FontWeight weight) {
  return TextStyle(
      fontSize: size,
      fontWeight: weight,
      color: Colors.white,
      fontFamily: 'Pretendard');
}

TextStyle Blue(double size, FontWeight weight) {
  return TextStyle(
      fontSize: size,
      fontWeight: weight,
      color: const Color(0xFF2B80FF),
      fontFamily: 'Pretendard');
}

TextStyle Gray(double size, FontWeight weight) {
  return TextStyle(
    color: Color(0xFFCCCCCC),
    fontSize: size,
    fontFamily: 'Pretendard',
    fontWeight: weight,
  );
}

TextStyle whiteOpacity(double size, FontWeight weight) {
  return TextStyle(
      fontSize: size,
      fontWeight: weight,
      color: Colors.white.withOpacity(0.6),
      fontFamily: 'Pretendard');
}

TextStyle Red(double size, FontWeight weight) {
  return TextStyle(
      fontSize: size,
      fontWeight: weight,
      color: Color(0xFFFF0000),
      fontFamily: 'Pretendard');
}

TextStyle Custom(double size, FontWeight weight, Color color) {
  return TextStyle(
      fontSize: size,
      fontWeight: weight,
      color: color,
      fontFamily: 'Pretendard');
}
