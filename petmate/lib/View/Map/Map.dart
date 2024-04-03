import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CategoryButton extends StatefulWidget {
  final Color color;
  final String label;
  final String iconPath;
  final double width;
  final double height;

  const CategoryButton({
    Key? key,
    required this.color,
    required this.label,
    required this.iconPath,
    this.width = 88,
    this.height = 40,
  }) : super(key: key);

  @override
  State<CategoryButton> createState() => _CategoryButtonState();
}

class _CategoryButtonState extends State<CategoryButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: Stack(
        children: [
          Container(
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.white),
          ),
          Container(
            width: widget.width,
            height: widget.height,
            padding: const EdgeInsets.fromLTRB(8, 6, 16, 6),
            decoration: BoxDecoration(
              color: widget.color,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(0, 2),
                    spreadRadius: 0),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image.asset(
                    widget.iconPath,
                    width: 28,
                    height: 28,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white.withOpacity(0.1)),
          ),
          Positioned(
            left: 42,
            top: 9,
            child: Text(
              widget.label,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MapPage extends StatefulWidget {
  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 110),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              CategoryButton(
                color: Color(0xCCFF2777),
                label: '병원',
                iconPath: 'assets/mapimg/filter (2).png',
              ),
              CategoryButton(
                color: Color(0xCCFFA903),
                label: '식당',
                iconPath: 'assets/mapimg/filter (1).png',
              ),
              CategoryButton(
                color: Color(0xCC4E9733),
                label: '공원',
                iconPath: 'assets/mapimg/filter (3).png',
              ),
              CategoryButton(
                color: Color(0xCCFF3800),
                label: '미용실',
                iconPath: 'assets/mapimg/filter (4).png',
                width: 102,
                height: 40,
              ),
              CategoryButton(
                color: Color(0xCC8E00FF),
                label: '애완용품샵',
                iconPath: 'assets/mapimg/filter (5).png',
                width: 130,
                height: 40,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
