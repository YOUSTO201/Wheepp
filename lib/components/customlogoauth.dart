import 'package:flutter/material.dart';

class CustomLogoAuth extends StatelessWidget {
  const CustomLogoAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child:
          Center(
        child: Image.asset(
          'images/wpa.png',
          height: 110,
        ),
      ),
    );
  }
}
