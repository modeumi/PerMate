import 'package:alarm/alarm.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:petmate/Controller/navigation_controller.dart';
import 'package:petmate/Controller/start_controller.dart';
import 'package:petmate/Util/route.dart';
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
  await NaverMapSdk.instance.initialize(
    clientId: naver_clientId,
    onAuthFailed: (ex) {
      debugPrint("********* 네이버맵 인증오류 : $ex *********");
    },
  );

  await Alarm.init(showDebugLogs: true); 
  await initializeDateFormatting('ko');

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive, overlays: []);
  Geolocator.requestPermission(); //권한설정

  runApp(
    ScreenUtilInit(
      designSize: Size(360, 800),
      splitScreenMode: true,
      minTextAdapt: true,
      child: GetMaterialApp(
        theme: ThemeData(fontFamily: 'Pretendard'),
        getPages: getpage,
        initialBinding: BindingsBuilder(() {
          Get.lazyPut(() => BottomNavigationBarController());
          Get.put(StartController());
        }),
        debugShowCheckedModeBanner: false,
        home: Splash(),
      ),
    ),
  );
}
