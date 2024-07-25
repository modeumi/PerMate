import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class Selectedthree extends StatefulWidget {
  final List<String> selected;
  final ValueChanged<String> onChanged;
  final width;
  const Selectedthree({super.key, required this.selected, this.width, required this.onChanged});

  @override
  State<Selectedthree> createState() => _SelectedthreeState();
}

class _SelectedthreeState extends State<Selectedthree> {
  bool gendercheck = false;
  int button = -1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 4, 0, 10),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(3, (int i) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  if (button == i) {
                  } else {
                    button = i;
                  }
                });
                widget.onChanged(widget.selected[i]);
              },
              child: Stack(children: [
                Container(
                  width: 100.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    color: button == i ? Colors.white : Colors.transparent,
                    border: GradientBoxBorder(
                      width: 1.w,
                      gradient: LinearGradient(
                        colors: [
                          Colors.white.withOpacity(0.5),
                          Colors.white.withOpacity(0.2)
                        ],
                      ),
                    ),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                Opacity(
                  opacity: 0.4,
                  child: Container(
                    width: 100.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: button == i
                                ? Colors.white.withOpacity(0.2)
                                : Color(0x4C000000),
                            blurRadius: 2,
                            offset: Offset(0, 0),
                            spreadRadius: 0,
                          )
                        ],
                        color: Color(0x3300287C),
                        borderRadius: BorderRadius.circular(10.r)),
                  ),
                ),
                Positioned.fill(
                  child: Center(
                    child: Text(
                      widget.selected[i],
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: button == i ? Color(0xFF303030) : Colors.white,
                          fontFamily: 'Pretendard'),
                    ),
                  ),
                )
              ]),
            );
          })),
    );
  }
}
