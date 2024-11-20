import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:petmate/Util/textstyles.dart';
import 'package:petmate/Widget/button/deletedbutton/content_deleted_button.dart';
import 'package:petmate/Widget/custom_widget/blue_container.dart';
import 'package:petmate/Widget/custom_widget/circle_container.dart';
import 'package:petmate/Widget/main/memo/memo_overlay.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class WalkTimer extends StatefulWidget {
  const WalkTimer({super.key});

  @override
  State<WalkTimer> createState() => _WalkTimerState();
}

class _WalkTimerState extends State<WalkTimer> {
  var memoValue = 1.0;
  var startButton = false;
  var _isHours = true;
  var isPaused = false;

  void WalkmemoOevrlay(BuildContext context) {
    Future.delayed(Duration(milliseconds: 0), () {
      setState(() {
        opactiyValue = 1.0;
        showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          barrierColor: Color(0x66303030),
          context: context,
          builder: (BuildContext context) {
            return MemoOverlay(
              color: Colors.white.withOpacity(0.2),
              shadowcolor: Color(0x4C000000),
            );
          },
        );
      });
    });
  }

  var opactiyValue = 1.0;

  void Deletedoevrlay(BuildContext context) {
    Future.delayed(Duration(milliseconds: 0), () {
      setState(() {
        opactiyValue = 1.0;
        showModalBottomSheet(
          backgroundColor: Colors.transparent,
          context: context,
          builder: (BuildContext context) {
            return ContentDeletedButton(
              title: '종료하기',
              content: '산책을 종료할까요?',
              text: '산책을 종료한 후에는 수정할수 없어요.',
              sharecontent: '',
              blueText: '종료하기',
              image:
                  Image.asset('assets/image_asset/walk_log/Rounded Square.png'),
              action: () {
                // 종료 버튼 눌렀을 때만 종료 팝업 뜨게 하기
                Navigator.of(context).pop();
                _stopWatchTimer.onStartTimer();
              },
              active: () {
                _stopWatchTimer.onStartTimer();
              },
            );
          },
        );
      });
    });
  }

  final StopWatchTimer _stopWatchTimer = StopWatchTimer(
    onChange: (value) => debugPrint('onChange $value'),
    onChangeRawSecond: (value) => debugPrint('onChangeRawSecond $value'),
    onChangeRawMinute: (value) => debugPrint('onChangeRawMinute $value'),
    onStopped: () {
      debugPrint('onStop');
    },
    onEnded: () {
      debugPrint('onEnded');
    },
  );

  @override
  void initState() {
    super.initState();
    _stopWatchTimer.rawTime.listen(
      (value) =>
          debugPrint('rawTime $value ${StopWatchTimer.getDisplayTime(value)}'),
    );
  }

  @override
  Future<void> dispose() async {
    // TODO: implement dispose
    super.dispose();
    await _stopWatchTimer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360.w,
      height: 295.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              GlassContainer(
                width: 344.w,
                height: 124.h,
                color: Colors.white.withOpacity(0.8),
                gradient: LinearGradient(
                  colors: [Colors.white, Colors.white],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderGradient: LinearGradient(
                  colors: [
                    Colors.white.withOpacity(0.2),
                    Colors.white.withOpacity(0.2),
                    Colors.white.withOpacity(0.2),
                    Colors.white.withOpacity(0.2),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.10, 0.30, 0.40, 0.0],
                ),
                blur: 12,
                borderRadius: BorderRadius.circular(10),
                borderWidth: 1.0,
                elevation: 0,
                boxShadow: [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(2, 2),
                    spreadRadius: 0,
                  )
                ],
              ),
              StreamBuilder<int>(
                  stream: _stopWatchTimer.rawTime,
                  initialData: _stopWatchTimer.rawTime.value,
                  builder: (context, snap) {
                    final value = snap.data!;
                    final displayTime =
                        StopWatchTimer.getDisplayTime(value, hours: _isHours);

                    // 소수점을 제거한 초 단위 표시
                    final parts = displayTime.split('.');
                    final timeWithoutMilliseconds = parts[0]; // 소수점 앞부분만 가져옴
                    return Positioned(
                      top: 19.h,
                      left: 85.w,
                      child: Text(
                        timeWithoutMilliseconds, // 소수점 제거된 시간 표시
                        style: TextStyle(
                          color: startButton
                              ? Color(0xFF303030)
                              : Color(0xFF303030).withOpacity(0.40),
                          fontSize: 40,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    );
                  }),
              Positioned(
                top: 76.h,
                left: 50.5.w,
                child: SizedBox(
                  width: 75.w,
                  child: Text(
                    '0.00km',
                    style: DarkGray(20.sp, FontWeight.w600),
                  ),
                ),
              ),
              Positioned(
                top: 76.h,
                left: 245.w,
                child: SizedBox(
                  width: 75.w,
                  child: Text(
                    '0kcal',
                    style: DarkGray(20.sp, FontWeight.w600),
                  ),
                ),
              ),
              Positioned(
                top: -30,
                left: 10,
                child: CircleContainer(
                  width: 60.w,
                  height: 60.w,
                ),
              ),
              Positioned(
                  top: -20,
                  left: 20,
                  child: Image.asset('assets/image_asset/walk_log/profile.png'))
            ],
          ),
          Stack(
            clipBehavior: Clip.none,
            children: [
              GlassContainer(
                width: 360.w,
                height: 160.h,
                color: Color(0xCC00287C),
                borderGradient: LinearGradient(
                  colors: [
                    Colors.white.withOpacity(0.5),
                    Colors.white.withOpacity(0.2),
                    Colors.white.withOpacity(0.2),
                    Colors.white.withOpacity(0.2),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.10, 0.30, 0.40, 0.0],
                ),
                blur: 12,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                borderWidth: 1.0,
                elevation: 0,
                boxShadow: [
                  BoxShadow(
                    color: Color(0x26000000),
                    blurRadius: 4,
                    offset: Offset(2, 2),
                    spreadRadius: 0,
                  )
                ],
              ),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(8, 12, 8, 0),
                    width: 344,
                    height: 52,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 2,
                          child: BlueContainer(
                            width: 168.w,
                            height: 52.h,
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: BlueContainer(
                            width: 168.w,
                            height: 52.h,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(8, 8, 8, 20),
                    width: 344,
                    height: 68,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 2,
                          child: BlueContainer(
                            width: 168.w,
                            height: 68.h,
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: BlueContainer(
                            width: 168.w,
                            height: 68.h,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                  left: 50.w,
                  top: 24.h,
                  child: InkWell(
                    onTap: () {
                      WalkmemoOevrlay(context);
                    },
                    child: SizedBox(
                      width: 84.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset('assets/image_asset/walk_log/note.png'),
                          Text(
                            '메모 추가',
                            style: White(12.sp, FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  )),
              Positioned(
                  left: 226.w,
                  top: 24.h,
                  child: InkWell(
                    onTap: () {},
                    child: SizedBox(
                      width: 84.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset('assets/image_asset/walk_log/toilet.png'),
                          Text(
                            '용변 기록',
                            style: White(12.sp, FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  )),
              Positioned(
                  left: 39.w,
                  top: 86.h,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        if (!startButton) {
                          startButton = true;
                          isPaused = false; //타이머가 시작되면 일시정지 상태가 아님
                          _stopWatchTimer.onStartTimer();
                        } else if (isPaused) {
                          // 타이머가 일시정지 상태일 때 종료하기 버튼 클릭 시 타이밍 종료
                          startButton = true;
                          isPaused = true;
                          _stopWatchTimer.onStopTimer();
                          Deletedoevrlay(context);
                        } else {
                          // 타이머 진행 중에 종료하기 버튼 클릭 시 타이머 종료
                          // startButton = true;
                          // isPaused = true;
                          // _stopWatchTimer.onStopTimer();
                          // Deletedoevrlay(context);
                        }
                      });
                    },
                    child: SizedBox(
                      width: 106.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          startButton && isPaused
                              ? Image.asset(
                                  'assets/image_asset/walk_log/stop.png')
                              : Image.asset(
                                  'assets/image_asset/walk_log/start.png'),
                          Text(
                            startButton && isPaused ? '종료하기' : '시작하기',
                            style: White(16.sp, FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  )),
              Positioned(
                  left: 217.w,
                  top: 86.h,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        if (startButton && !isPaused) {
                          // 타이머가 실행 중일 때 일시정지 버튼을 누르면 타이머 일시정지
                          isPaused = true;
                          _stopWatchTimer.onStopTimer();
                          // } else if (startButton && isPaused) {
                          //   // 타이머가 일시정지 상태일때 일시정지 버튼을 누르면 타이머 재개
                          //   isPaused = false;
                          //   _stopWatchTimer.onStartTimer();
                          // }
                        }
                      });
                    },
                    child: SizedBox(
                      width: 106.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset('assets/image_asset/walk_log/pause.png'),
                          Text(
                            '일시정지',
                            style: White(16.sp, FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
