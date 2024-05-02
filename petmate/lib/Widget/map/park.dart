import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ParkWidget extends StatefulWidget {
  const ParkWidget({super.key});

  @override
  State<ParkWidget> createState() => _ParkWidgetState();
}

class _ParkWidgetState extends State<ParkWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 10,
      ),
      width: 88,
      height: 40,
      child: Column(
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              child: Stack(
                children: [
                  Opacity(
                    opacity: 0.2,
                    child: Container(
                      width: 88,
                      height: 40,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x26000000),
                              blurRadius: 2,
                              offset: Offset(2, 2),
                              spreadRadius: 0,
                            )
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  Container(
                    width: 88,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    width: 88,
                    height: 40,
                    padding: const EdgeInsets.fromLTRB(8, 6, 16, 6),
                    decoration: BoxDecoration(
                      color: Color(0xCC4E9733),
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
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Image.asset(
                            'assets/mapimg/filter (3).png',
                            width: 28,
                            height: 28,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 88,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white.withOpacity(0.1),
                    ),
                  ),
                  Positioned(
                    left: 42,
                    top: 9,
                    child: Text(
                      '공원',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
