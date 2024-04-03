import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:petmate/View/Map/HomePage.dart';
import 'package:petmate/View/Map/Map.dart';
import 'package:petmate/View/Map/naver_map.dart';
import 'package:petmate/test_page.dart';
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
    clientId: 'd0y4umwxnz',
    onAuthFailed: (ex) {
      debugPrint("********* 네이버맵 인증오류 : $ex *********");
    },
  );
  runApp(
    const MaterialApp(
      home: Test_Page(),
    ),
  );
}
