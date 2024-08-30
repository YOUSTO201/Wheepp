import 'package:chatapp/components/app_colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:lottie/lottie.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Basma extends StatefulWidget {
  const Basma({super.key});

  @override
  State<Basma> createState() => _BasmaState();
}

class _BasmaState extends State<Basma> {
  final LocalAuthentication auth = LocalAuthentication();

  chechAuthentication() async {
    bool isAvailable;

    isAvailable = await auth.canCheckBiometrics;

    if (isAvailable) {
      bool result = await auth.authenticate(
        localizedReason: 'Varify the identity is required',
      );
      if (result) {
        Navigator.of(context).pushNamed('chatPage');
      } else {}
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    bool isSwitched = false;
    return Scaffold(
      backgroundColor: backgroundcolor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) => AlertDialog(
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Close',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                        await FirebaseAuth.instance.signOut();
                        Navigator.of(context)
                            .pushNamedAndRemoveUntil("login", (routs) => false);
                      },
                      child: Text(
                        'Signout',
                        style: TextStyle(
                          color: const Color.fromARGB(255, 213, 57, 46),
                          fontSize: 16.5,
                        ),
                      ),
                    ),
                  ],
                  backgroundColor: backgroundcolor,
                  title: Text(
                    'Are you sure to Signout?',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 184, 184, 184),
                      fontSize: 20,
                    ),
                  ),
                ),
              );
            },
            icon: Icon(
              Icons.logout,
              color: Colors.white,
              size: 30,
            ),
          ),
          SizedBox(width: 13.5),
        ],
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 225,
                child: Lottie.asset('assets/as.json'),
              ),
            ],
          ),
          SizedBox(height: 100),
          Center(
            child: ElevatedButton.icon(
              onPressed: () {
                chechAuthentication();
              },
              icon: Icon(
                Icons.fingerprint,
                size: 35,
              ),
              label: Padding(
                padding: const EdgeInsets.only(top: 8.5, bottom: 8.5),
                child: Text(
                  'Confirm identity',
                  style: TextStyle(
                    fontSize: 19.5,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 125,
          ),
          Container(
            height: 115,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              image: DecorationImage(
                image: AssetImage('images/mainqr.jpg'),
              ),
            ),
          ),
          SizedBox(height: 15),
          Container(
            child: Text(
              'Facebook QR code',
              style: TextStyle(color: grey, fontSize: 12.5),
            ),
          )
        ],
      ),
    );
  }
}
