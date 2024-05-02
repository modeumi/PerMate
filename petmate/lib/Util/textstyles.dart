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

TextStyle Custom(double size, FontWeight weight, Color color) {
  return TextStyle(
      fontSize: size,
      fontWeight: weight,
      color: color,
      fontFamily: 'Pretendard');
}

