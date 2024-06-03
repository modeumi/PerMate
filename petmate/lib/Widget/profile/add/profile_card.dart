import 'package:flutter/material.dart';
import 'package:petmate/Util/textstyles.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
    required this.imgUrl,
    required this.petName,
  });

  final String imgUrl;
  final String petName;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 104,
      height: 20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(width: 24, height: 24, child: Image.asset(imgUrl)),
          Text(
            petName,
            style: Black(14, FontWeight.w500),
          )
        ],
      ),
    );
  }
}
