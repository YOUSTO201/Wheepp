import 'package:chatapp/auth/login.dart';
import 'package:chatapp/auth/signup.dart';
import 'package:chatapp/components/app_colors.dart';
import 'package:chatapp/components/custombuttonauth.dart';
import 'package:flutter/material.dart';


class Los extends StatelessWidget {
  const Los({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundcolor,
      body: Container(
        decoration: BoxDecoration(
          color: backgroundcolor,
          image: DecorationImage(
            image: AssetImage('images/khal.png'),
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 180),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12.5),
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 43.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12.5),
                  child: Text(
                    'Start with Login or Signup',
                    style: TextStyle(
                      fontSize: 18.5,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
              ],
            ),
            
            SizedBox(height: 300),
            GestureDetector(
              onTap: () {
              Navigator.pushNamed(context, 'login');
              },
              child: CustomButtonAuth(
                title: 'Login',
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'signup');
              },
              child: CustomButtonAuth(
                title: 'Signup',
                
              ),
            ),
          ],
        ),
      ),
    );
  }
}
