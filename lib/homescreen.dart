import 'package:chatapp/components/app_colors.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundcolor,
      appBar: AppBar(
        shadowColor: Colors.black,
        backgroundColor: backgroundcolor,
        title: Row(
          children: [
            Text(
              'Wheep',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 139),
            Container(
              child: Row(
                children: [
                  Icon(
                    Icons.camera_alt_outlined,
                    color: Colors.white,
                  ),
                  SizedBox(width: 20),
                  Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  SizedBox(width: 20),
                  Icon(
                    Icons.more_vert_outlined,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            child: Divider(
              thickness: .1,
              height: 1,
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 1),
                      child: Image.asset(
                        'images/youana.png',
                        height: 60,
                        width: 100,
                      ),
                    ),
                    // SizedBox(width: 8),
                    Container(
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 18.5),
                            child: Text(
                              'Yousto',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          // Text('Hello my friend !'),
                          Padding(
                            padding:
                                const EdgeInsets.only(bottom: 20, left: 130),
                            child: Text(
                              '13:47',
                              style: TextStyle(
                                color: grey,
                                fontSize: 15,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
