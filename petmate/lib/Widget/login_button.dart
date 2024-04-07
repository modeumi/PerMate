import 'package:flutter/material.dart';

class LoginButton extends StatefulWidget {
  final Color color;
  final String image;
  final String contenct;
  final VoidCallback event;
  const LoginButton(
      {super.key,
      required this.color,
      required this.image,
      required this.contenct,
      required this.event});

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.event,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 24),
        padding: EdgeInsets.symmetric(horizontal: 9, vertical: 12),
        height: 48,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: widget.color),
        child: Row(
          children: [
            Image.asset(widget.image),
            Expanded(
                child: Text(
              widget.contenct,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
              textAlign: TextAlign.center,
            ))
          ],
        ),
      ),
    );
  }
}
