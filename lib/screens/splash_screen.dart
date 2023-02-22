import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  @override
  void initState() {
    controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    animation = Tween<double>(begin: 0, end: 75).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    controller.forward();
    super.initState();
    Timer(const Duration(seconds: 3), navigator);
  }

  void navigator() async {
    Get.to(
      Home(),
      curve: Curves.easeInExpo,
      duration: Duration(seconds: 3),
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blueAccent[100],
      resizeToAvoidBottomInset: true,
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(children: [
            const SizedBox(
              height: 370,
            ),
            Container(
              height: animation.value,
              width: animation.value,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.white10),
                borderRadius: const BorderRadius.all(
                  Radius.circular(30),
                ),
                boxShadow: const [
                  BoxShadow(color: Colors.black12, offset: Offset(0.2, 4.5))
                ],
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(60)),
                child: Image.asset(
                  'assets/images/wallymart.jpg',
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
