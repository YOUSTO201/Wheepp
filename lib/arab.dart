import 'package:chatapp/Ara.dart';
import 'package:chatapp/components/app_colors.dart';
import 'package:chatapp/slang.dart';
import 'package:flutter/material.dart';

class Arab extends StatefulWidget {
  const Arab({super.key});

  @override
  State<Arab> createState() => _ArabState();
}

class _ArabState extends State<Arab> {
  String? language = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundcolor,
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 75),
            Center(
              child: Image.asset(
                'images/wpa.png',
                height: 120,
              ),
            ),
            SizedBox(height: 45),
            Container(
              child: Text(
                'أهلاً بك في وييب',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                ),
              ),
            ),
            SizedBox(height: 15),
            Text(
              'اختار لغتك لنبدأ',
              style: TextStyle(
                  color: Colors.white, fontSize: 25, fontFamily: 'Rubik'),
            ),
            SizedBox(height: 50),
            RadioListTile(
              subtitle: Text(
                "(لغة الجهاز)",
                style: TextStyle(color: grey, fontSize: 15),
              ),
              selectedTileColor: backgroundcolor,
              activeColor: lightgreen,
              title: Text(
                'الإنجليزية',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              value: 'Arabic',
              groupValue: language,
              onChanged: (val) {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (BuildContext Context) => Slang()),
                );
                setState(() {
                  language = val;
                });
              },
            ),
            SizedBox(height: 12.5),
            GestureDetector(
              onTap: () {},
              child: RadioListTile(
                selectedTileColor: backgroundcolor,
                activeColor: lightgreen,
                title: Text(
                  'العربية',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                value: 'English',
                groupValue: language,
                onChanged: (val) {
                  setState(() {
                    var language = val;
                  });
                },
              ),
            ),
            SizedBox(height: 180),
            Padding(
              padding: const EdgeInsets.only(right: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                    Navigator.pushNamed(context, 'ara');
                    },
                    child: Container(
                      height: 65,
                      width: 70,
                      decoration: BoxDecoration(
                        color: lightgreen,
                        borderRadius: BorderRadius.circular(18.5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            offset: Offset(2, 2),
                            blurRadius: 15,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.arrow_forward,
                        color: backgroundcolor,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
