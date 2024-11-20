import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petmate/Controller/start_controller.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    Get.put(StartController());
    return Scaffold(
      body: Container( 
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/onboarding/Background.png'),
              fit: BoxFit.fill),
        ),
        child: Stack(
          children: [
            Center(
              child: Image.asset('assets/onboarding/logo_3.png'),
            ),
            Positioned(
                bottom: 50,
                left: 0,
                right: 0,
                child: Center(
                  child: Image.asset('assets/onboarding/team_logo.png'),
                ))
          ],
        ),
      ),
    );
  }
}
