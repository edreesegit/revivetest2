// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:revivetest2/auth/main_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Transform.scale(
          scale: 6,
          child: Lottie.network(
            'https://assets2.lottiefiles.com/packages/lf20_W5Sk67.json',
            controller: _controller,
            onLoaded: (composition) {
              // Configure the AnimationController with the duration of the
              // Lottie file and start the animation.
              _controller
                ..duration = composition.duration
                ..forward()
                ..addListener(() {
                  if (_controller.isCompleted) {
                    // Navigate to the main page when the animation finishes.
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => MainPage()),
                    );
                  }
                });
            },
          ),
        ),
      ),
    );
  }
}
