import 'dart:async';

import 'package:flutter/material.dart';

import 'home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), navigator);
  }

  void navigator() async {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: ((context) => const Home())));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent[100],
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
              height: 72,
              width: 72,
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
