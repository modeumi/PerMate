import 'package:flutter/material.dart';
import 'package:petmate/Provider/onboarding_provider.dart';
import 'package:petmate/View/login_select.dart';
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
              onTap: () {
                Provider.of<OnboardingProvider>(context, listen: false)
                    .page_change(0);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginSelect(),
                    ));
              },
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
  }
}
