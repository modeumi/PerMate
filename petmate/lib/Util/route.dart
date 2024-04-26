import 'package:get/get.dart';
import 'package:petmate/View/Notice/notice.dart';
import 'package:petmate/View/Notice/noticedelete.dart';
import 'package:petmate/View/join_main.dart';
import 'package:petmate/View/join_success.dart';
import 'package:petmate/View/login_main.dart';
import 'package:petmate/View/login_select.dart';
import 'package:petmate/View/mainpage.dart';
import 'package:petmate/View/onboarding.dart';
import 'package:petmate/View/password_search.dart';
import 'package:petmate/View/splash.dart';

List<GetPage<dynamic>> getpage = [
  GetPage(name: '/splash', page: () => const Splash()),
  GetPage(name: '/onboarding', page: () => const Onboarding()),
  GetPage(name: '/login_select', page: () => const LoginSelect()),
  GetPage(name: '/login', page: () => const LoginMain()),
  GetPage(name: '/passwordreset', page: () => const PasswordReset()),
  GetPage(name: '/join', page: () => const JoinMain()),
  GetPage(name: '/join_success', page: () => const JoinSuccess()),
  GetPage(name: '/main', page: () => const MainPage()),
  GetPage(name: '/notice', page: () => const NoticePage()),
  GetPage(name: '/notice_detail', page: () => const NoticeDeleted()),
];
