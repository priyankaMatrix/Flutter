import 'dart:async';

import 'package:flutter/material.dart';
import 'package:test1/login_screen.dart';
import 'color_constant.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
               LoginScreen()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color:ColorConstants.themeColor
        ),
        child: Image.asset('assets/images/loginBg.png'),
      ),
    );
  }
}
