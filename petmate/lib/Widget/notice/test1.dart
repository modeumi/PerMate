import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart'; // Import SpinKitFadingCircle
import 'package:petmate/Widget/notice/notification_container.dart';
import 'package:petmate/Widget/notice/notification_type.dart';
import 'package:petmate/Widget/notice/notificationcontainer2.dart';

class NoticePage2 extends StatefulWidget {
  const NoticePage2({Key? key});

  @override
  State<NoticePage2> createState() => _NoticePage2State();
}

class _NoticePage2State extends State<NoticePage2> {
  bool isLoading = false;
  List<Widget> notificationWidgets = [];

  @override
  void initState() {
    super.initState();
    // Simulate initial data loading
    _loadData();
  }

  void _loadData() {
    // Simulate data loading delay
    setState(() {
      isLoading = true;
    });
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        notificationWidgets.addAll([
          NotificationWidget(),
          NotificationContainer(),
          NotificationContainer2(),
          NotificationContainer2(),
        ]);
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Image.asset('assets/alert/back.png'),
        centerTitle: true,
        title: Text(
          '알림',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              onTap: () {},
              child: Image.asset('assets/alert/delete(24).png'),
            ),
          )
        ],
      ),
      extendBodyBehindAppBar: true,
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollInfo) {
          if (!isLoading &&
              scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
            // Reached the bottom of the list, load more data
            _loadData();
            return true;
          }
          return false;
        },
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 812,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/Main/Background.png'),
                  fit: BoxFit.fill,
                ),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: notificationWidgets,
                ),
              ),
            ),
            if (isLoading)
              Positioned.fill(
                child: Container(
                  width: double.maxFinite,
                  height: double.maxFinite,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 100,
                        child: SpinKitFadingCircle(
                          color: Colors.white.withOpacity(0.8), // Set the color
                          size: 50.0, // Set the size
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
