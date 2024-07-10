import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:petmate/DataTools/kakao.dart';
import 'package:petmate/Util/textstyles.dart';
import 'package:petmate/Widget/custom_widget/circle_container.dart';
import 'package:petmate/Widget/custom_widget/custom_container.dart';
import 'package:petmate/Widget/login_button.dart';

class AccountLinkWidget extends StatefulWidget {
  const AccountLinkWidget({super.key});

  @override
  State<AccountLinkWidget> createState() => _AccountLinkWidgetState();
}

class _AccountLinkWidgetState extends State<AccountLinkWidget> {
  get controller => null;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 102.h,
          left: 117.w,
          child: CircleContainer(
            width: 126.w,
            height: 126.h,
          ),
        ),
        Positioned(
          top: 102.h,
          left: 117.w,
          child: Image.asset('assets/image_asset/mypage/profile.png'),
        ),
        Positioned(
          top: 240.h,
          left: 142.w,
          child: Text(
            '닉네임 님',
            style: White(20.sp, FontWeight.w600),
          ),
        ),
        Positioned(
          top: 296.h,
          left: 8.w,
          child: CustomContainer(
            width: 344.w,
            height: 428.h,
            shadow_color: Color(0x4C000000),
          ),
        ),
        Positioned(
            top: 311.h,
            left: 20.w,
            child: Text(
              '카카오 연동',
              style: White(14.sp, FontWeight.w600),
            )),
        Positioned(
          bottom: MediaQuery.sizeOf(context).height * 0.51,
          left: 0,
          right: 0,
          child: LoginButton(
            color: const Color(0xFFFEE500),
            image: 'assets/onboarding/kakaotalk_bubble.png',
            contenct: '카카오 로그인',
            event: () async {
              print('카카오');
              Map<String, String> result = await KakaoLogin().Kakao_login();
              if (result.isNotEmpty) {
                bool login = await controller.KaKao_Login(result);
                print('성공');
                if (login) {
                  Get.toNamed('/main');
                }
              } else {
                print('실패');
              }
            },
          ),
        ),
      ],
    );
  }
}
