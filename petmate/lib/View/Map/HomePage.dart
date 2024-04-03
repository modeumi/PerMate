
// import 'package:blurrycontainer/blurrycontainer.dart';
// import 'package:flutter/material.dart';
// import 'package:gradient_borders/box_borders/gradient_box_border.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   bool state = false;
//   bool state2 = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: double.infinity,
//         height: 812,
//         decoration: BoxDecoration(
//           image: DecorationImage(
//               image: AssetImage('assets/Android_Large_-_22.png'),
//               fit: BoxFit.fill),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Stack(
//               children: [
//                 Opacity(
//                   opacity: 0.05,
//                   child: Container(
//                     margin: EdgeInsets.all(16),
//                     width: 247,
//                     height: 40,
//                     decoration: BoxDecoration(
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black,
//                             offset: Offset(3, 3),
//                           )
//                         ],
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(20)),
//                   ),
//                 ),
//                 Container(
//                   width: 247,
//                   height: 40,
//                   margin: EdgeInsets.all(16),
//                   decoration: BoxDecoration(
//                     color: state2
//                         ? Colors.white.withOpacity(0.2)
//                         : Colors.transparent,
//                     border: GradientBoxBorder(
//                       width: 1,
//                       gradient: LinearGradient(
//                         colors: [
//                           Colors.white.withOpacity(0.5),
//                           Colors.white.withOpacity(0.2)
//                         ],
//                       ),
//                     ),
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: state2
//                       ? Container()
//                       : BlurryContainer(
//                           blur: 12,
//                           elevation: 0,
//                           borderRadius: BorderRadius.circular(20),
//                           child: Container(),
//                         ),
//                 ),
//                 Positioned(
//                     left: 25, top: 23, child: Image.asset('assets/Clock.png')),
//                 Positioned(
//                     left: 58,
//                     top: 23,
//                     child: Opacity(
//                       opacity: 0.60,
//                       child: Text(
//                         '알람 등록시 표시됩니다.',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 14,
//                           fontFamily: 'Pretendard',
//                           fontWeight: FontWeight.w600,
//                           height: 0,
//                         ),
//                       ),
//                     )),
//               ],
//             ),
//             SizedBox(
//               height: 40,
//             ),
//             SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 children: [
//                   for (int i = 1; i < 4; i++)
//                     Stack(
//                       children: [
//                         Opacity(
//                           opacity: 0.05,
//                           child: Container(
//                             margin: EdgeInsets.symmetric(horizontal: 5),
//                             width: 50,
//                             height: 50,
//                             decoration: BoxDecoration(
//                               shape: BoxShape.circle,
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.black,
//                                   offset: Offset(3, 3),
//                                 )
//                               ],
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               state = !state;
//                             });
//                           },
//                           child: Container(
//                             width: 50,
//                             height: 50,
//                             margin: EdgeInsets.symmetric(horizontal: 5),
//                             decoration: BoxDecoration(
//                               shape: BoxShape.circle,
//                               color: state ? Colors.white : Colors.transparent,
//                               border: GradientBoxBorder(
//                                 width: 1,
//                                 gradient: LinearGradient(
//                                   colors: [
//                                     Colors.white.withOpacity(0.5),
//                                     Colors.white.withOpacity(0.2)
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             child: ClipOval(
//                               child: state
//                                   ? Container(
//                                       width: 50,
//                                       height: 50,
//                                       child: Image.asset(
//                                         "assets/Dog face.png",
//                                       ),
//                                     )
//                                   : BlurryContainer(
//                                       blur: 12,
//                                       elevation: 0,
//                                       child: Image.asset(
//                                         "assets/Cat face.png",
//                                       ),
//                                     ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 30,
//             ),
//             Stack(
//               children: [
//                 Opacity(
//                   opacity: 0.05,
//                   child: Container(
//                     margin: EdgeInsets.all(16),
//                     width: double.infinity,
//                     height: 50,
//                     decoration: BoxDecoration(
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black,
//                             offset: Offset(3, 3),
//                           )
//                         ],
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(10)),
//                   ),
//                 ),
//                 Container(
//                   width: double.infinity,
//                   height: 50,
//                   margin: EdgeInsets.all(16),
//                   decoration: BoxDecoration(
//                     color: state2
//                         ? Colors.white.withOpacity(0.2)
//                         : Colors.transparent,
//                     border: GradientBoxBorder(
//                       width: 1,
//                       gradient: LinearGradient(
//                         colors: [
//                           Colors.white.withOpacity(0.5),
//                           Colors.white.withOpacity(0.2)
//                         ],
//                       ),
//                     ),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: state2
//                       ? Container()
//                       : BlurryContainer(
//                           blur: 12,
//                           elevation: 0,
//                           borderRadius: BorderRadius.circular(10),
//                           child: Container(),
//                         ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
