import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:petmate/Controller/memo_controller.dart';

class CustomScrollbar extends StatefulWidget {
  const CustomScrollbar({super.key});

  @override
  State<CustomScrollbar> createState() => _CustomScrollbarState();
}

class _CustomScrollbarState extends State<CustomScrollbar> {
  MemoController memoController = Get.put(MemoController());
  @override
  Widget build(BuildContext context) {
    return ScrollbarTheme(
        data: ScrollbarThemeData(
            crossAxisMargin: 0.2,
            trackColor: WidgetStatePropertyAll(Colors.white.withOpacity(0.6)),
            minThumbLength: 30,
            mainAxisMargin: -30,
            thumbColor: WidgetStatePropertyAll(Colors.white)),
        child: Scrollbar(
            thickness: 2,
            controller: memoController.scrollController,
            thumbVisibility: true,
            trackVisibility: true,
            radius: Radius.circular(10),
            child: Container()));
  }
}
