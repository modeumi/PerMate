import 'package:flutter/material.dart';
import 'package:petmate/Provider/onboarding_provider.dart';
import 'package:provider/provider.dart';

class OnboardingAppBar extends StatefulWidget implements PreferredSizeWidget {
  const OnboardingAppBar({super.key});

  @override
  State<OnboardingAppBar> createState() => _OnboardingAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _OnboardingAppBarState extends State<OnboardingAppBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Container(
            width: 56,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (int i = 0; i < 4; i++)
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(
                            context.watch<OnboardingProvider>().page == i
                                ? 0xFF316BD5
                                : 0xFFCECECE)),
                  ),
              ],
            ),
          ),
        ),
        actions: [
          Opacity(
            opacity: 0.50,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                child: const Text(
                  '건너뛰기',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
        leading: Container(),
      ),
    );
    // Container(
    //   width: MediaQuery.of(context).size.width,
    //   child: Stack(
    //     children: [
    //       Center(
    //         child: Row(
    //           children: [
    //             for (int i = 0; i < 4; i++)
    //               Container(
    //                 width: 8,
    //                 height: 8,
    //                 decoration: BoxDecoration(
    //                     shape: BoxShape.circle,
    //                     color: Color(
    //                         context.read<OnboardingProvider>().page == i
    //                             ? 0xFF316BD5
    //                             : 0xFFCECECE)),
    //               ),
    //           ],
    //         ),
    //       ),
    //       const Positioned(
    //         right: 20,
    //         child: Opacity(
    //           opacity: 0.50,
    //           child: Text(
    //             '건너뛰기',
    //             textAlign: TextAlign.center,
    //             style: TextStyle(
    //               color: Colors.black,
    //               fontSize: 14,
    //               fontFamily: 'Pretendard',
    //               fontWeight: FontWeight.w500,
    //             ),
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
