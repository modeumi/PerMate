import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:petmate/Controller/start_controller.dart';
import 'package:petmate/Util/route.dart';
import 'package:petmate/View/mainpage.dart';
import 'package:petmate/View/splash.dart';
import 'firebase_options.dart';
import 'package:petmate/key.dart';
import 'package:kakao_flutter_sdk_auth/kakao_flutter_sdk_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  KakaoSdk.init(
      nativeAppKey: kakao_nativeAppKey,
      javaScriptAppKey: kakao_javaScriptAppKey);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  WidgetsFlutterBinding.ensureInitialized();
  await NaverMapSdk.instance.initialize(
    clientId: naver_clientId,
    onAuthFailed: (ex) {
      debugPrint("********* 네이버맵 인증오류 : $ex *********");
    },
  );

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive, overlays: []);
  Geolocator.requestPermission(); //권한설정

  runApp(
    GetMaterialApp(
      theme: ThemeData(fontFamily: 'Pretendard'),
      getPages: getpage,
      initialBinding: BindingsBuilder(() {
        Get.put(StartController());
      }),
      debugShowCheckedModeBanner: false,
      home: MainPage(),
      // home: WeatherWigdget(),
    ),
  );
}
