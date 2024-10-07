import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:petmate/Controller/memo_controller.dart';
import 'package:petmate/Util/textstyles.dart';
import 'package:petmate/Widget/custom_widget/custom_container.dart';

import 'package:petmate/View/Main/Memo/memopage.dart';

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
          Get.to(() => MemoPage());
        },
        child: Stack(children: [
          CustomContainer(
            width: 344.w,
            height: 108.h,
            color: Color(0x3300287C),
            shadow_color: Color(0x26000000),
          ),
          Positioned(
              top: 12.h,
              left: 12.h,
              child: Text('메모', style: White(12.sp, FontWeight.w500))),
          Positioned(
            top: 35.h,
            left: 12.h,
            child: SizedBox(
              width: 322.w,
              height: 120.h,
              child: ScrollbarTheme(
                data: ScrollbarThemeData(
                    crossAxisMargin: 0.2,
                    trackColor:
                        WidgetStatePropertyAll(Colors.white.withOpacity(0.6)),
                    minThumbLength: 8,
                    mainAxisMargin: -1,
                    radius: Radius.circular(50),
                    thumbColor: WidgetStatePropertyAll(Colors.white)),
                child: Scrollbar(
                  thickness: 2,
                  controller: memoController.scrollController,
                  thumbVisibility: true,
                  trackVisibility: true,
                  radius: Radius.circular(50),
                  child: SingleChildScrollView(
                    controller: memoController.scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        StreamBuilder<List<Map<String, dynamic>>>(
                            stream: memoController.getMemos(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.white.withOpacity(0.6),
                                  ),
                                );
                              } else if (!snapshot.hasData ||
                                  snapshot.data!.isEmpty) {
                                return const Text('');
                              } else {
                                return Column(
                                    children: snapshot.data!.map((memo) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: White(
                                                      12.sp, FontWeight.w500)),
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
                                  );
                                }).toList());
                              }
                            }),
                        SizedBox(
                          height: 52.h,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ]));
  }
}
