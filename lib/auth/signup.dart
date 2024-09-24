import 'package:chatapp/components/app_colors.dart';
import 'package:chatapp/components/custombuttonauth.dart';
import 'package:chatapp/generated/l10n.dart';
import 'package:chatapp/helper/ssb.dart';
import 'package:chatapp/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool eye = true;
  String? email;
  String? password;
  bool isLodaing = false;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLodaing,
      child: Scaffold(
        body: Container(
          color: backgroundcolor,
          padding: const EdgeInsets.all(10),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 70),
                    Center(
                      child: Text(
                        S.of(context).SignupButton,
                        style: TextStyle(
                          fontSize: isArabic() ? 32 : 37.5,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: 'Rubik',
                        ),
                      ),
                    ),
                    SizedBox(height: 75),
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
                      validator: (data) {
                        if (data!.isEmpty) {
                          return S.of(context).fieldIsRequired;
                        }
                      },
                      onChanged: (data) {
                        email = data;
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
                    SizedBox(height: 8),
                    TextFormField(
                      validator: (data) {
                        if (data!.isEmpty) {
                          return S.of(context).fieldIsRequired;
                        }
                      },
                      onChanged: (data) {
                        password = data;
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
                        hintText: S.of(context).HintTextPassword,
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
                  ],
                ),
                SizedBox(height: 80),
                Center(
                  child: GestureDetector(
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        isLodaing = true;
                        setState(() {});
                        try {
                          await registeruser();
                          FirebaseAuth.instance.currentUser!
                              .sendEmailVerification();
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
                                          final user =
                                              FirebaseAuth.instance.currentUser;
                                          await user?.delete();
                                          Navigator.of(context).pop();
                                        },
                                        child: Text(
                                          S.of(context).Close,
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontSize: isArabic() ? 18.5 : 16,
                                          ),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context)
                                              .pushNamed("login");
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
                                      S.of(context).OopsSignup,
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
                        } on FirebaseAuthException catch (ex) {
                          if (ex.code == 'weak-password') {
                            ssb(context, S.of(context).WeakPassword);
                          } else if (ex.code == 'email-already-in-use') {
                            ssb(context, S.of(context).EmailAlreadyInUse);
                          }
                        } catch (ex) {
                          ssb(context, S.of(context).Error);
                        }
                        isLodaing = false;
                        setState(() {});
                      } else {}
                    },
                    child: CustomButtonAuth(
                      title: S.of(context).SignupButton,
                    ),
                  ),
                ),
                const SizedBox(height: 90),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        S.of(context).HaveAnAccount,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: grey,
                          fontSize: isArabic() ? 15 : 16.5,
                          fontFamily: 'Rubik',
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed("login");
                        },
                        child: Text(
                          S.of(context).LoginButton,
                          style: TextStyle(
                            color: lightgreen,
                            fontWeight: FontWeight.bold,
                            fontSize: isArabic() ? 15 : 16.5,
                            fontFamily: 'Rubik',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> registeruser() async {
    UserCredential user =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}