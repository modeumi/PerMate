import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:petmate/Controller/memo_controller.dart';
import 'package:petmate/Util/textstyles.dart';
import 'package:petmate/Widget/custom_widget/custom_container.dart';

class MemoDeleted extends StatefulWidget {
  const MemoDeleted({super.key});

  @override
  State<MemoDeleted> createState() => _MemoDeletedState();
}

class _MemoDeletedState extends State<MemoDeleted> {
  MemoController memoController = Get.put(MemoController());

  @override
  Widget build(
    BuildContext context,
  ) {
    return StreamBuilder<List<Map<String, dynamic>>>(
        stream: memoController.getMemos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Text('');
          } else {
            return Column(
                children: snapshot.data!.map((memo) {
              String memoId = memo['id'];
              bool isSelected = memoController.selectedMemoIds[memoId] ?? false;
              var timestamp = memo['timestamp'];

              // 타임스탬프를 DateTime으로 변환하기
              DateTime? dateTime;
              if (timestamp is Timestamp) {
                dateTime = timestamp.toDate();
              } else if (timestamp is DateTime) {
                dateTime = timestamp;
              }

              // 날짜 포맷팅 (12시간 형식으로 오전/오후 포함)
              String formattedDate =
                  dateTime != null ? _formatDateTime(dateTime) : '';

              return Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: CustomContainer(
                      width: 344.w,
                      height: 80.h,
                      color: Color(0x3300287C),
                      shadow_color: Color(0x26000000),
                    ),
                  ),
                  Positioned(
                    top: 32.h,
                    left: 11.w,
                    child: Container(
                      width: 20.w,
                      height: 20.h,
                      child: GestureDetector(
                          onTap: () {
                            setState(() {
                              memoController.memoCheckSeleced(memoId);
                              print('확인메세지 : $memoId');
                            });
                          },
                          child: Image.asset(isSelected
                              ? 'assets/alert/check_selected.png'
                              : 'assets/alert/check_default.png')),
                    ),
                  ),
                  Positioned(
                    left: 40.w,
                    top: 35.h,
                    child: Container(
                      width: 288.w,
                      height: 38.h,
                      child: Text(memo['content'] ?? '',
                          overflow: TextOverflow.ellipsis,
                          style: White(12.sp, FontWeight.w500)),
                    ),
                  ),
                  Positioned(
                    right: 12.w,
                    bottom: 12.h,
                    child: Text(formattedDate,
                        style: White(10.sp, FontWeight.w500)),
                  ),
                ],
              );
            }).toList());
          }
        });
  }

  // 날짜 및 시간 포맷팅 함수
  String _formatDateTime(DateTime dateTime) {
    // 오전/오후 구분
    String amPm = dateTime.hour < 12 ? '오전' : '오후';
    // 12시간 형식의 시간
    int hour = dateTime.hour % 12;
    hour = hour == 0 ? 12 : hour; // 12시 경우 처리

    // 포맷팅 문자열
    String formattedDate = DateFormat('MM/dd').format(dateTime);
    formattedDate +=
        ' $amPm ${hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';

    return formattedDate;
  }
}
