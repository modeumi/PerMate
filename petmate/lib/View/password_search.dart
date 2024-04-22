import 'package:flutter/material.dart';
import 'package:petmate/Widget/custom_appbar.dart';

class PasswordSearch extends StatefulWidget {
  const PasswordSearch({super.key});

  @override
  State<PasswordSearch> createState() => _PasswordSearchState();
}

class _PasswordSearchState extends State<PasswordSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: '비밀번호 찾기'),
      // body: ,
    );
  }
}
