import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:petmate/Util/textstyles.dart';
import 'package:petmate/Widget/custom_widget/custom_container.dart';

class MemoNotcieWidget extends StatefulWidget {
  const MemoNotcieWidget({super.key});

  @override
  State<MemoNotcieWidget> createState() => _MemoNotcieWidgetState();
}

class _MemoNotcieWidgetState extends State<MemoNotcieWidget> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> fetchMemos() async {
    QuerySnapshot snapshot = await firestore.collection('Memo').get();
    return snapshot.docs
        .map((doc) => {
              'content': doc['content'],
              'timestamp': (doc['timestamp'] as Timestamp).toDate(),
            })
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
        future: fetchMemos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Text('no memos');
          } else {
            return Column(
                children: snapshot.data!.map((memo) {
              return Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: CustomContainer(
                      width: 344.w,
                      height: 80.h,
                      shadow_color: Color(0x26000000),
                    ),
                  ),
                  Positioned(
                      top: 35.h,
                      left: 11.w,
                      child: Image.asset('assets/edit/menu.png')),
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
                    child: Text(
                        memo['timestamp'] != null
                            ? '${memo['timestamp'].month}/${memo['timestamp'].day} ${memo['timestamp'].hour}${memo['timestamp'].minute}'
                            : '',
                        style: White(10.sp, FontWeight.w500)),
                  ),
                ],
              );
            }).toList());
          }
        });
  }
}
