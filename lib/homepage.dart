import 'package:chatapp/components/app_colors.dart';
import 'package:flutter/material.dart';

class Homapage extends StatefulWidget {
  const Homapage({super.key});

  @override
  State<Homapage> createState() => _HomapageState();
}

class _HomapageState extends State<Homapage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundcolor,
      body: ListView(
        children: [
          Center(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 200),
                child: Text(
                  'Hello',
                  style: TextStyle(
                    color: lightgreen,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
