// import 'package:blurrycontainer/blurrycontainer.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:petmate/Util/textstyles.dart';

// class DeletedOverlay extends StatefulWidget {
//   const DeletedOverlay({super.key});

//   @override
//   State<DeletedOverlay> createState() => _DeletedOverlayState();
// }

// class _DeletedOverlayState extends State<DeletedOverlay> {
//   OverlayEntry? deletoverlay;
//   var opactiyValue = 1.0;
//   bool state = false;
//   List<bool> deletedCheck = [false, false, false];

//   void deletedItems() {
//     setState(() {
//       deletedCheck.asMap().forEach((index, isSelected) {
//         if (isSelected) {
//           deletedCheck[index] = false;
//         }
//       });
//     });
//   }

//   @override
//   void Deletedoevrlay(BuildContext context) {
//     Future.delayed(Duration(milliseconds: 0), () {
//       setState(() {
//         opactiyValue = 1.0;
//         showModalBottomSheet(
//           backgroundColor: Colors.transparent,
//           context: context,
//           isScrollControlled: true,
//           builder: (BuildContext context) {
//             return AnimatedContainer(
//               duration: Duration(milliseconds: 0),
//               curve: Curves.easeIn,
//               child: Stack(
//                 children: [
//                   Container(
//                     width: 360,
//                     height: 160,
//                     decoration: BoxDecoration(
//                       color: state
//                           ? Colors.white.withOpacity(0.2)
//                           : Colors.transparent,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: state
//                         ? Container()
//                         : BlurryContainer(
//                             blur: 12,
//                             elevation: 0,
//                             borderRadius: BorderRadius.circular(10),
//                             child: Container(),
//                           ),
//                   ),
//                   Container(
//                     width: 360,
//                     height: 160,
//                     decoration: ShapeDecoration(
//                       color: Colors.white.withOpacity(0.8),
//                       shape: RoundedRectangleBorder(
//                         side: BorderSide(
//                           width: 1,
//                           color: Colors.white.withOpacity(0.2),
//                         ),
//                         borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(10),
//                           topRight: Radius.circular(10),
//                         ),
//                       ),
//                     ),
//                     child: Stack(
//                       children: [
//                         Container(
//                           width: 100,
//                           height: 45,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               SizedBox(
//                                 width: 5,
//                               ),
//                               Image.asset('assets/alert/delete(14).png'),
//                               DefaultTextStyle(
//                                 style: TextStyle(
//                                   color: Color(0xFF303030),
//                                   fontSize: 14,
//                                   fontFamily: 'Pretendard',
//                                   fontWeight: FontWeight.w600,
//                                   height: 0,
//                                 ),
//                                 child: Text('삭제하기'),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Positioned(
//                           top: 40,
//                           left: 20,
//                           child: DefaultTextStyle(
//                               style: TextStyle(
//                                 color: Color(0xFF303030),
//                                 fontSize: 12,
//                                 fontFamily: 'Pretendard',
//                                 fontWeight: FontWeight.w500,
//                               ),
//                               child: Text('알림을 삭제할까요?')),
//                         ),
//                         SizedBox(height: 8),
//                         Positioned(
//                           top: 60,
//                           left: 20,
//                           child: Container(
//                             width: 195,
//                             child: DefaultTextStyle(
//                                 style: TextStyle(
//                                   color: Color(0xFF303030),
//                                   fontSize: 12,
//                                   fontFamily: 'Pretendard',
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                                 child: Text('알림을 삭제한 후에는 복구할 수 없어요.')),
//                           ),
//                         ),
//                         Positioned(
//                           bottom: 20,
//                           left: 20,
//                           child: Row(
//                             children: [
//                               GestureDetector(
//                                 onTap: () {
//                                   Get.back();
//                                 },
//                                 child: Container(
//                                   width: 156,
//                                   height: 48,
//                                   padding: const EdgeInsets.symmetric(
//                                       horizontal: 16, vertical: 12),
//                                   decoration: ShapeDecoration(
//                                     color: Colors.white
//                                         .withOpacity(0.800000011920929),
//                                     shape: RoundedRectangleBorder(
//                                       side: BorderSide(
//                                           width: 1, color: Color(0x332B80FF)),
//                                       borderRadius: BorderRadius.circular(10),
//                                     ),
//                                   ),
//                                   child: Column(
//                                     mainAxisSize: MainAxisSize.min,
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.center,
//                                     children: [
//                                       DefaultTextStyle(
//                                           style: TextStyle(
//                                             color: Color(0xFF2B80FF),
//                                             fontSize: 15,
//                                             fontFamily: 'Pretendard',
//                                             fontWeight: FontWeight.w600,
//                                           ),
//                                           child: Text('취소')),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(
//                                 width: 8,
//                               ),
//                               GestureDetector(
//                                 onTap: () {
//                                   setState(() {
//                                     List<int> indexesToRemove = [];
//                                     for (int i = deletedCheck.length - 1;
//                                         i >= 0;
//                                         i--) {
//                                       if (deletedCheck[i]) {
//                                         deletedCheck.removeAt(i);
//                                       }
//                                     }
//                                     for (int index in indexesToRemove) {
//                                       deletedCheck.removeAt(index);
//                                     }
//                                   });
//                                 },
//                                 child: Container(
//                                   width: 156,
//                                   height: 48,
//                                   padding: const EdgeInsets.symmetric(
//                                       horizontal: 16, vertical: 12),
//                                   decoration: ShapeDecoration(
//                                     color: Color(0xFF2B80FF),
//                                     shape: RoundedRectangleBorder(
//                                       side: BorderSide(
//                                         width: 1,
//                                         color: Colors.white
//                                             .withOpacity(0.20000000298023224),
//                                       ),
//                                       borderRadius: BorderRadius.circular(10),
//                                     ),
//                                   ),
//                                   child: Column(
//                                     mainAxisSize: MainAxisSize.min,
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.center,
//                                     children: [
//                                       DefaultTextStyle(
//                                           style: White(15, FontWeight.w600),
//                                           child: Text('삭제하기')),
//                                     ],
//                                   ),
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//         );
//       });
//     });
//   }
// }
