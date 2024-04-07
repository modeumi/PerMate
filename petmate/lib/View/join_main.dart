import 'package:flutter/material.dart';
import 'package:petmate/Provider/join_provider.dart';
import 'package:petmate/Widget/check_button.dart';
import 'package:petmate/Widget/join/emailfield.dart';
import 'package:petmate/Widget/textfield_slot.dart';
import 'package:provider/provider.dart';

class JoinMain extends StatefulWidget {
  const JoinMain({super.key});

  @override
  State<JoinMain> createState() => _JoinMainState();
}

class _JoinMainState extends State<JoinMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
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
            const Center(
              child: Text(
                '회원가입',
                textAlign: TextAlign.center,
                style: TextStyle(
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
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/onboarding/Background.png'),
          ),
        ),
        child: ListView(
          children: [EmailField()],
        ),
      ),
    );
  }
}
