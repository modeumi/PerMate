import 'package:flutter/material.dart';
import 'package:petmate/Provider/onboarding_provider.dart';
import 'package:provider/provider.dart';

class OnboardingBody extends StatefulWidget {
  const OnboardingBody({super.key});

  @override
  State<OnboardingBody> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingBody> {
  List<String> introduce = [
    '다양한 편의 기능들과 함께\n일지를 기록해 보세요',
    '기록한 일지를\n보기 쉽게 정리해 드릴게요',
    '내 주변 정보들부터\n원하는 모든곳을 찾아보세요',
    '정보를 공유하고 물건들을 거래하고\n동네 산책메이트와 소통해 보아요',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 43),
          width: MediaQuery.of(context).size.width,
          height: 80,
          child: Text(
            introduce[context.read<OnboardingProvider>().page],
            style: const TextStyle(
              color: Color(0xFF444444),
              fontSize: 20,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 430,
          child: Image.asset(
            'assets/onboarding/tempimg${(context.watch<OnboardingProvider>().page) + 1}.png',
            fit: BoxFit.fill,
          ),
        ),
        const SizedBox(
          height: 160,
        )
      ],
    );
  }
}
