import 'package:chatapp/auth/login.dart';
import 'package:chatapp/auth/signup.dart';
import 'package:chatapp/components/app_colors.dart';
import 'package:chatapp/components/custombuttonauth.dart';
import 'package:flutter/material.dart';

class Ara extends StatelessWidget {
  const Ara({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundcolor,
      body: Container(
        decoration: BoxDecoration(
          color: backgroundcolor,
          image: DecorationImage(
            image: AssetImage('images/khala.png'),
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 180),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 12.5),
                  child: Text(
                    'هيا نبدأ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 43.5,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Rubik',
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10.5),
                  child: Text(
                    'ابدأ بتسجيل الدخول او إنشاء حساب',
                    style: TextStyle(
                        fontSize: 14.5,
                        color: Colors.white,
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.w600,),
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
                title: 'تسجيل الدخول',
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
              Navigator.pushNamed(context, 'signup');
              },
              child: CustomButtonAuth(
                title: 'إنشاء حساب',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
