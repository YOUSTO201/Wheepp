import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:chatapp/slang.dart';
import 'package:flutter/material.dart';

class Splahs extends StatelessWidget {
  const Splahs({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AnimatedSplashScreen(
        backgroundColor: Color.fromARGB(255, 102, 102, 102),
        splashIconSize: 200,
        splash: CircleAvatar(
        backgroundColor: Color.fromARGB(255, 84, 84, 84),
          radius: 350,
          backgroundImage: AssetImage("images/yf.png"),
        ),
        nextScreen: Slang(),
      ),
    );
  }
}
