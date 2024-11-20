import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class OptionType extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final List<String> options;
  final width;
  final height;
  const OptionType(
      {super.key,
      required this.options,
      this.width,
      this.height,
      required this.onChanged});

  @override
  State<OptionType> createState() => _OptionTypeState();
}

class _OptionTypeState extends State<OptionType> {
  bool gendercheck = false;
  int button = -1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 4, 0, 10),
      child: Container(
        width: widget.width,
        height: widget.height,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(2, (int i) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    button = i;
                  });
                  widget.onChanged(widget.options[i]);
                 
                },
                child: Stack(children: [
                  Container(
                    width: 154.w,
                    height: 40.h,
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      color: button == i ? Colors.white : Colors.transparent,
                      border: GradientBoxBorder(
                        width: 1,
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
                      width: 154.w,
                      height: 40.h,
                      margin: EdgeInsets.symmetric(horizontal: 4),
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
                  Positioned(
                    left: 75.w,
                    top: 10.h,
                    child: Text(
                      widget.options[i],
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: button == i ? Color(0xFF303030) : Colors.white,
                          fontFamily: 'Pretendard'),
                    ),
                  )
                ]),
              );
            })),
      ),
    );
  }
}
