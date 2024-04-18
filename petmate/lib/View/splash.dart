import 'dart:async';

import 'package:flutter/material.dart';
import 'package:petmate/Provider/start_provider.dart';
import 'package:petmate/View/login_select.dart';
import 'package:petmate/View/onboarding.dart';
import 'package:provider/provider.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<StartProvider>(builder: (context, provider, child) {
        return FutureBuilder<bool>(
            future: provider.PassOnboarding(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container(
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
                            child:
                                Image.asset('assets/onboarding/team_logo.png'),
                          ))
                    ],
                  ),
                );
              } else {
                bool result = snapshot.data ?? false;
                print('확인 3 $result');
                if (result) {
                  print('확인 4 : 여기');
                  return const LoginSelect();
                } else {
                  print('확인 5 : 저기');
                  return const Onboarding();
                }
              }
            });
      }),
    );
  }
}
