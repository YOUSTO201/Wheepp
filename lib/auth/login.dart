import 'package:chatapp/components/app_colors.dart';
import 'package:chatapp/components/custombuttonauth.dart';
import 'package:chatapp/generated/l10n.dart';
import 'package:chatapp/helper/ssb.dart';
import 'package:chatapp/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
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
  final LocalAuthentication auth = LocalAuthentication();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLodaing,
      child: Scaffold(
        body: Container(
          color: backgroundcolor,
          padding: EdgeInsets.all(10),
          child: Form(
            key: formmKey,
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 60),
                    Center(
                      child: Text(
                        S.of(context).LoginButton,
                        style: TextStyle(
                          fontSize: isArabic() ? 32 : 37.5,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: 'Rubik',
                        ),
                      ),
                    ),
                    SizedBox(height: isArabic() ? 90 : 70),
                    Padding(
                      padding: EdgeInsets.only(
                        left: isArabic() ? 0 : 17.5,
                        right: isArabic() ? 12.5 : 0,
                      ),
                      child: Text(
                        S.of(context).Email,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          fontFamily: 'Rubik',
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
                          return S.of(context).fieldIsRequired;
                        }
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[400],
                        ),
                        hintText: S.of(context).HintTextEmail,
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
                      padding: EdgeInsets.only(
                        left: isArabic() ? 0 : 17.5,
                        right: isArabic() ? 12.5 : 0,
                      ),
                      child: Text(
                        S.of(context).Password,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: isArabic() ? 22.5 : 20,
                          fontFamily: 'Rubik',
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
                          return S.of(context).fieldIsRequired;
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
                        hintText: S.of(context).Enterpass,
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
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed("resetPassword");
                      },
                      child: Container(
                        alignment: Alignment.topRight,
                        margin: EdgeInsets.only(top: 25, bottom: 25, right: 10),
                        child: Text(
                          S.of(context).ForgotPassword,
                          style: TextStyle(
                            fontWeight:
                                isArabic() ? FontWeight.w700 : FontWeight.bold,
                            fontSize: 15.5,
                            color: Colors.grey,
                            fontFamily: 'Rubik',
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
                              FirebaseAuth.instance.currentUser!.emailVerified
                                  ? Navigator.pushNamed(
                                      context,
                                      'chatPage',
                                      arguments: email,
                                    )
                                  : showDialog(
                                      barrierDismissible: false,
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        actions: [
                                          TextButton(
                                            onPressed: () async {
                                              if (formmKey.currentState!
                                                  .validate()) {
                                                try {
                                                  await login();
                                                  await FirebaseAuth
                                                      .instance.currentUser!
                                                      .sendEmailVerification();
                                                  Navigator.of(context).pop();
                                                  ssj(
                                                      context,
                                                      S
                                                          .of(context)
                                                          .SubmitedSucceed);
                                                } on FirebaseAuthException catch (e) {
                                                  if (e.code ==
                                                      'invalid-email') {
                                                    ssb(
                                                        context,
                                                        S
                                                            .of(context)
                                                            .InvalidEmail);
                                                  } else if (e.code ==
                                                      'network-request-failed') {
                                                    ssb(
                                                        context,
                                                        S
                                                            .of(context)
                                                            .BadNetwork);
                                                  } else if (e.code ==
                                                      'too-many-requests') {
                                                    ssb(
                                                        context,
                                                        S
                                                            .of(context)
                                                            .TooManyRequest);
                                                  } else {
                                                    ssb(context,
                                                        'There was an error');
                                                  }
                                                  Navigator.of(context).pop();
                                                }
                                              }
                                            },
                                            child: Text(
                                              S
                                                  .of(context)
                                                  .SendVerificationAgain,
                                              style: TextStyle(
                                                color: Colors.green,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text(
                                              S.of(context).Ok,
                                              style: TextStyle(
                                                color: Colors.green,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                        ],
                                        backgroundColor: backgroundcolor,
                                        title: Text(
                                          S.of(context).OopsLogin,
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                              255,
                                              184,
                                              184,
                                              184,
                                            ),
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                    );
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'invalid-email') {
                                ssb(context, S.of(context).InvalidEmail);
                              } else if (e.code == 'invalid-credential') {
                                ssb(context, S.of(context).WrongCredentials);
                              } else if (e.code == 'network-request-failed') {
                                ssb(context, S.of(context).BadNetwork);
                              } else if (e.code == 'too-many-requests') {
                                ssb(context, S.of(context).TooManyRequest);
                              } else {
                                ssb(context, 'There was an error');
                              }
                            } catch (e) {
                              ssb(context, S.of(context).Error);
                            }
                            isLodaing = false;
                            setState(() {});
                          } else {}
                        },
                        child: CustomButtonAuth(
                          onPressed: () async {
                            Navigator.pushNamed(context, 'chatPage',
                                arguments: email);
                          },
                          title: S.of(context).LoginButton,
                        ),
                      ),
                    ),
                    SizedBox(height: 70),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            S.of(context).NewInWheepp,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: grey,
                              fontSize: 17.5,
                              fontFamily: 'Rubik',
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed("signup");
                            },
                            child: Text(
                              S.of(context).SignupButton,
                              style: TextStyle(
                                color: lightgreen,
                                fontWeight: FontWeight.bold,
                                fontSize: 17.5,
                                fontFamily: 'Rubik',
                              ),
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
    UserCredential user =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
