import 'package:flutter/material.dart';

class CustomAppbar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppbar({super.key, required this.title});

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppbarState extends State<CustomAppbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 100,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      title: Stack(
        children: [
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset('assets/onboarding/icon_5.png'),
            ),
          ),
          Center(
            child: Text(
              widget.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
