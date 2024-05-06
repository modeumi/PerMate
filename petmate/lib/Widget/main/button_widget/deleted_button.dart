import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:petmate/Util/textstyles.dart';

class DeletedButtonWidget extends StatefulWidget {
  const DeletedButtonWidget({super.key});

  @override
  State<DeletedButtonWidget> createState() => _DeletedButtonWidgetState();
}

class _DeletedButtonWidgetState extends State<DeletedButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 344,
          height: 60,
          decoration: ShapeDecoration(
            color: Colors.white.withOpacity(0.8),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                color: Colors.white.withOpacity(0.2),
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            shadows: [
              BoxShadow(
                color: Color(0x33000000),
                blurRadius: 12,
                offset: Offset(0, 0),
                spreadRadius: 5,
              )
            ],
          ),
        ),
        Opacity(
          opacity: 0.8,
          child: Container(
            width: 344,
            height: 60,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color(0x33000000),
                    blurRadius: 2,
                    offset: Offset(2, 2),
                    spreadRadius: 0,
                  )
                ],
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(10)),
          ),
        ),
        Positioned(
          left: 125,
          bottom: 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/alert/delete(16).png'),
              SizedBox(
                width: 8,
              ),
              Text('삭제하기',
                  textAlign: TextAlign.center,
                  style: Black(16, FontWeight.w600)),
            ],
          ),
        ),
      ],
    );
  }
}
