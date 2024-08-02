import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:petmate/Controller/memo_controller.dart';
import 'package:petmate/Util/textstyles.dart';
import 'package:petmate/Widget/custom_widget/custom_container.dart';
import 'package:petmate/Widget/main/memo/memo_notice.dart';

class MemoWriteWidget extends StatefulWidget {
  const MemoWriteWidget({super.key});

  @override
  State<MemoWriteWidget> createState() => _MemoWriteWidgetState();
}

class _MemoWriteWidgetState extends State<MemoWriteWidget> {
  MemoController memoController = Get.put(MemoController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => MemoNotice());
      },
      child: Stack(children: [
        CustomContainer(
          width: 344.w,
          height: 108.h,
          shadow_color: Color(0x26000000),
        ),
        Positioned(
          top: 12.h,
          left: 12.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('메모', style: White(12.sp, FontWeight.w500)),
              FutureBuilder<List<Map<String, dynamic>>>(
                  future: memoController.getMemos(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: Colors.white.withOpacity(0.6),
                        ),
                      );
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Text('');
                    } else {
                      return Column(
                          children: snapshot.data!.map((memo) {
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 100.w,
                                height: 25.h,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 4.w,
                                      height: 4.h,
                                      child: Image.asset(
                                        'assets/Main/Rectangle (1).png',
                                      ),
                                    ),
                                    SizedBox(
                                      width: 4.w,
                                    ),
                                    Expanded(
                                      child: Text(memo['content'] ?? '',
                                          style: White(12.sp, FontWeight.w500)),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 312.w,
                                height: 1,
                                color: Colors.white.withOpacity(0.2),
                              ),
                            ],
                          ),
                        );
                      }).toList());
                    }
                  }),
            ],
          ),
        ),
      ]),
    );
  }
}
