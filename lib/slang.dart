import 'package:chatapp/arab.dart';
import 'package:chatapp/components/app_colors.dart';
import 'package:chatapp/los.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class Slang extends StatefulWidget {
  const Slang({super.key});

  @override
  State<Slang> createState() => _SlangState();
}

class _SlangState extends State<Slang> {

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
                'Welcome to Wheepp',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
            SizedBox(height: 15),
            Text(
              'Choose your language to get started',
              style: TextStyle(
                color: Colors.white,
                fontSize: 17.5,
              ),
            ),
            SizedBox(height: 50),
            RadioListTile(
              subtitle: Text(
                "(Device's language)",
                style: TextStyle(color: grey, fontSize: 15),
              ),
              selectedTileColor: backgroundcolor,
              activeColor: lightgreen,
              title: Text(
                'English',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              value: 'English',
              groupValue: language,
              onChanged: (val) {
                setState(() {
                  language = val;
                });
              },
            ),
            SizedBox(height: 12.5),
            GestureDetector(
              onTap: () {},
              child: RadioListTile(
                subtitle: Text(
                  'Arabic',
                  style: TextStyle(
                    color: grey,
                    fontSize: 15,
                  ),
                ),
                selectedTileColor: backgroundcolor,
                activeColor: lightgreen,
                title: Text(
                  'العربية',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                value: 'Arabic',
                groupValue: language,
                onChanged: (val) {
                Navigator.pushNamed(context, 'arab');
                  setState(() {
                    language = val;
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
                    Navigator.pushNamed(context, 'los');
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
