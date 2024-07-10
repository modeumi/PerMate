import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petmate/Widget/custom_widget/custom_container.dart';

class Calender extends StatefulWidget {
  const Calender({super.key});

  @override
  State<Calender> createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomContainer(
          width: 344.w,
          height: 146.h,
          shadow_color: Color(0x4C000000),
        )
      ],
    );
  }
}
