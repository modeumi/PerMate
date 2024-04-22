import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:petmate/Provider/weatherprovider.dart';

import 'package:provider/provider.dart';

class WeatherWigdget extends StatefulWidget {
  const WeatherWigdget({
    super.key,
  });

  @override
  State<WeatherWigdget> createState() => _WeatherWigdgetState();
}

class _WeatherWigdgetState extends State<WeatherWigdget> {
  bool state2 = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

//  현재위치 호출

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(builder: (context, provider, child) {
      provider.Set_Weather();

      return provider.loading
          ? Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 172,
                  margin: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: state2
                        ? Colors.white.withOpacity(0.2)
                        : Colors.transparent,
                    border: GradientBoxBorder(
                      width: 1,
                      gradient: LinearGradient(
                        colors: [
                          Colors.white.withOpacity(0.5),
                          Colors.white.withOpacity(0.2)
                        ],
                      ),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: state2
                      ? Container()
                      : BlurryContainer(
                          blur: 12,
                          elevation: 0,
                          borderRadius: BorderRadius.circular(10),
                          child: Container(),
                        ),
                ),
                Opacity(
                  opacity: 0.4,
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    width: double.infinity,
                    height: 172,
                    decoration: BoxDecoration(
                        boxShadow: [
                          const BoxShadow(
                            color: Color(0x26000000),
                            blurRadius: 2,
                            offset: Offset(1, 1),
                            spreadRadius: 0,
                          )
                        ],
                        color: const Color(0x3300287C),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                Positioned(
                  right: 12,
                  top: 18,
                  child: Container(
                    width: 326,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          '날씨',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Container(
                          width: 60,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text(
                                '반송동',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w600,
                                  height: 0,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  debugPrint('clicked~~');
                                  ();
                                },
                                child: Image.asset(
                                  'assets/Main/reset.png',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 20,
                  top: 42,
                  child: provider.image,
                ),
                Positioned(
                  left: 87,
                  top: 42,
                  child: Container(
                    width: 44,
                    height: 64,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          '${provider.weatherData.main!.temp}\u2103',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          '${provider.weatherData.weather![0].description}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 140,
                  top: 40,
                  child: Container(
                    width: 58,
                    height: 64,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '강수 확률',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.6),
                            fontSize: 10,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Text(
                          '100%',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Container(
                          width: 58,
                          height: 16,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xFF62BDFF)),
                          child: const Text(
                            '습도 100%',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  right: 90,
                  top: 40,
                  child: Container(
                    width: 58,
                    height: 64,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '미세 먼지',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.6),
                            fontSize: 10,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          provider.text,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Container(
                          width: 33,
                          height: 16,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xFFFF6262),
                          ),
                          child: Text(
                            '${provider.pm10}',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  right: 20,
                  top: 40,
                  child: Container(
                    width: 58,
                    height: 64,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '초미세 먼지',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.6),
                            fontSize: 10,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          provider.text,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Container(
                          width: 33,
                          height: 16,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xFFFF6262),
                          ),
                          child: Text(
                            '${provider.pm2_5}',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                    left: 50,
                    bottom: 11,
                    child: Image.asset('assets/Main/tree.png')),
                Positioned(
                    left: 110,
                    bottom: 11,
                    child: Image.asset('assets/Main/tree.png')),
                Positioned(
                    left: 170,
                    bottom: 11,
                    child: Image.asset('assets/Main/tree.png')),
                Positioned(
                    right: 60,
                    bottom: 11,
                    child: Image.asset('assets/Main/pet.png')),
              ],
            )
          : CircularProgressIndicator(
              color: Colors.blue,
            );
    });
  }
}
