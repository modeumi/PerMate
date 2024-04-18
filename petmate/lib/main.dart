import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:petmate/Provider/join_provider.dart';
import 'package:petmate/Provider/login_provider.dart';
import 'package:petmate/Provider/onboarding_provider.dart';
import 'package:petmate/Provider/start_provider.dart';
import 'package:petmate/View/splash.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:kakao_flutter_sdk_auth/kakao_flutter_sdk_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  KakaoSdk.init(
      nativeAppKey: '6aff6a6a32983c77785cb5df7c9dd27a',
      javaScriptAppKey: '07060657d09cc65bb1e781ae2325d058');

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive, overlays: []);

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => OnboardingProvider()),
      ChangeNotifierProvider(create: (_) => JoinProvider()),
      ChangeNotifierProvider(create: (_) => StartProvider()),
      ChangeNotifierProvider(create: (_) => LoginProvider()),
    ],
    child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
    ),
  ));
}
