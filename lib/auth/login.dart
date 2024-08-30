// import 'dart:ui';
import 'package:chatapp/components/app_colors.dart';
import 'package:chatapp/components/custombuttonauth.dart';
// import 'package:chatapp/forpass.dart';
import 'package:chatapp/helper/ssb.dart';
// import 'package:chatapp/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool eye = true;

  String? email, password;
  bool isLodaing = false;
  GlobalKey<FormState> formmKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLodaing,
      child: Scaffold(
        body: Container(
          color: backgroundcolor,
          padding: const EdgeInsets.all(10),
          child: Form(
            key: formmKey,
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 70),
                    Center(
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 37.5,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 17.5),
                      child: const Text(
                        'Email',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      onChanged: (data) {
                        email = data;
                      },
                      validator: (data) {
                        if (data!.isEmpty) {
                          return 'field is required';
                        }
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[400],
                        ),
                        hintText: 'example@gmail.com',
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(color: lightgreen),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(color: lightgreen),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(
                            color: lightgreen,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.only(left: 17.5),
                      child: const Text(
                        'Password',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Container(height: 8),
                    TextFormField(
                      onChanged: (data) {
                        password = data;
                      },
                      validator: (data) {
                        if (data!.isEmpty) {
                          return 'field is required';
                        }
                      },
                      obscureText: eye,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              eye = !eye;
                            });
                          },
                          icon: Icon(
                            eye ? Icons.visibility_off : Icons.visibility,
                            color: backgroundcolor,
                          ),
                        ),
                        hintStyle: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[400],
                        ),
                        hintText: 'Enter your password',
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(color: lightgreen),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(color: lightgreen),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(
                            color: lightgreen,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      alignment: Alignment.topRight,
                      margin:
                          const EdgeInsets.only(top: 25, bottom: 25, right: 10),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, 'forpass');
                        },
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: GestureDetector(
                        onTap: () async {
                          if (formmKey.currentState!.validate()) {
                            isLodaing = true;
                            setState(() {});
                            try {
                              await login();
                              Navigator.pushNamed(context, 'basma', arguments: email);
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'invalid-email') {
                                ssb(context, 'Invalid email');
                              } else if (e.code == 'invalid-credential') {
                                ssb(context, 'Wrong credentials');
                              } else if (e.code == 'too-many-requests') {
                                ssb(context,
                                    'Too many requests, Try again later');
                              } else {
                                ssb(context, 'There was an error');
                              }
                            } catch (e) {
                              ssb(context, 'There was an error');
                            }
                            isLodaing = false;
                            setState(() {});
                          } else {}
                        },
                        child: CustomButtonAuth(
                          title: 'Login',
                        ),
                      ),
                    ),
                    SizedBox(height: 70),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "New in wheepp? ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: grey,
                              fontSize: 17.5,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed("signup");
                            },
                            child: Text(
                              "Signup",
                              style: TextStyle(
                                  color: lightgreen,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17.5),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> login() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}
