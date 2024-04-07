import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:petmate/Provider/join_provider.dart';
import 'package:petmate/Widget/check_button.dart';
import 'package:petmate/Widget/textfield_slot.dart';
import 'package:provider/provider.dart';

class EmailField extends StatefulWidget {
  const EmailField({super.key});

  @override
  State<EmailField> createState() => _EmailFieldState();
}

class _EmailFieldState extends State<EmailField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: Column(
        children: [
          Text(
            '이메일 (아이디)',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w600,
              height: 0,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 3,
                child: TextFieldSlot(
                    hint: 'example@example.com',
                    controller:
                        Provider.of<JoinProvider>(context, listen: false)
                            .email),
              ),
              SizedBox(
                width: 8,
              ),
              Flexible(
                  flex: 1, child: CheckButton(event: () {}, content: '인증 요청'))
            ],
          ),
          SizedBox(
            height: 8,
          ),
          TextFieldSlot(
              hint: 'example@example.com',
              controller:
                  Provider.of<JoinProvider>(context, listen: false).email),
        ],
      ),
    );
  }
}
