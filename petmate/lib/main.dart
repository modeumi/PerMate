import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:petmate/Model/current_weather.dart';
import 'package:petmate/Provider/join_provider.dart';
import 'package:petmate/Provider/login_provider.dart';
import 'package:petmate/Provider/onboarding_provider.dart';
import 'package:petmate/Provider/start_provider.dart';
import 'package:petmate/Provider/weatherprovider.dart';
import 'package:petmate/View/Map/naver_map.dart';
import 'package:petmate/View/Notice/noticedelete.dart';
import 'package:petmate/View/mainpage.dart';
import 'package:petmate/Widget/main/weather.dart';
import 'package:petmate/Widget/notice/test3.dart';
import 'package:petmate/Widget/notice/test.dart';
import 'package:petmate/View/splash.dart';
import 'package:petmate/Widget/notice/test1.dart';
import 'package:petmate/View/Notice/notice.dart';
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
  WidgetsFlutterBinding.ensureInitialized();
  await NaverMapSdk.instance.initialize(
    clientId: "d0y4umwxnz",
    onAuthFailed: (ex) {
      debugPrint("********* 네이버맵 인증오류 : $ex *********");
    },
  );

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive, overlays: []);

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => OnboardingProvider()),
      ChangeNotifierProvider(create: (_) => JoinProvider()),
      ChangeNotifierProvider(create: (_) => StartProvider()),
      ChangeNotifierProvider(create: (_) => LoginProvider()),
      ChangeNotifierProvider(create: (_) => WeatherProvider())
      
    ],
    child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WeatherWigdget(),
    ),
  ));
}
