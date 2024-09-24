import 'package:chatapp/components/app_colors.dart';
import 'package:chatapp/components/custombuttonauth.dart';
import 'package:chatapp/generated/l10n.dart';
import 'package:chatapp/main.dart';
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
            fit: BoxFit.fill,
            image: isArabic()
                ? AssetImage('images/khala.png')
                : AssetImage('images/khal.png'),
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 180),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: isArabic() ? 0 : 12.5,
                    right: isArabic() ? 12.5 : 0,
                  ),
                  child: Text(
                    S.of(context).GetStarted,
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
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: isArabic() ? 0 : 12.5,
                    right: isArabic() ? 12.5 : 0,
                  ),
                  child: Text(
                    S.of(context).LoginorSignup,
                    style: TextStyle(
                      fontSize: isArabic() ? 14.5 : 17.5,
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 350),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'login');
              },
              child: CustomButtonAuth(
                title: S.of(context).LoginButton,
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'signup');
              },
              child: CustomButtonAuth(
                title: S.of(context).SignupButton,
              ),
            ),
          ],
        ),
      ),
    );
  }
}