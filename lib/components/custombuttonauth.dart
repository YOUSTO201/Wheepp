import 'package:chatapp/components/app_colors.dart';
import 'package:flutter/material.dart';

class CustomButtonAuth extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  const CustomButtonAuth({super.key, this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: lightgreen,
          borderRadius: BorderRadius.circular(15.5),
        ),
        height: 52.5,
        width: 320,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontSize: 27.5,
              fontWeight: FontWeight.bold,
              fontFamily: 'Rubik',
            ),
          ),
        ),
      ),
    );
  }
}