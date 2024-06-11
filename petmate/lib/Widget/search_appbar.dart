import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class SearchAppbar extends StatefulWidget {
  final List<Widget> actions;
  final VoidCallback change;
  final VoidCallback finish;
  const SearchAppbar(
      {super.key,
      required this.actions,
      required this.change,
      required this.finish});

  @override
  State<SearchAppbar> createState() => _SearchAppbarState();
}

class _SearchAppbarState extends State<SearchAppbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: MediaQuery.sizeOf(context).width,
      margin: EdgeInsets.fromLTRB(
          8, MediaQuery.sizeOf(context).height * 0.0625, 8, 0),
      child: Row(
        children: [
          Flexible(
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              height: 40,
               decoration: BoxDecoration(
                  boxShadow: const [
                        BoxShadow(
                          color: Color(0x26000000),
                          blurRadius: 2,
                          offset: Offset(0, 2),
                          spreadRadius: 0,
                        )
                      ],
                    border: GradientBoxBorder(
                      width: 1,
                      gradient: LinearGradient(
                        colors: [
                          Colors.white.withOpacity(0.5),
                          Colors.white.withOpacity(0.2)
                        ],
                      ),
                    ),
                    color: Color(0x3300287c),
                    borderRadius: BorderRadius.circular(20),
                  ),
              child: BlurryContainer(
                height: 40,
                width: MediaQuery.sizeOf(context).width,
                blur: 12,
                elevation: 0,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                          onTap: () {},
                          child: Container(
                            child: Image.asset(
                              'assets/mapimg/Search.png',
                            ),
                          ),
                        ),
                        border: InputBorder.none,
                        hintText: '검색어를 입력해주세요',
                        hintStyle: TextStyle(
                          color: Color(0xFFCCCCCC).withOpacity(0.6),
                          fontSize: 14,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w600,
                        )),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
