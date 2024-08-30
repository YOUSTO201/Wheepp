import 'package:chatapp/chatpage.dart';
import 'package:chatapp/components/app_colors.dart';
import 'package:chatapp/components/custombuttonauth.dart';
import 'package:chatapp/helper/ssb.dart';
import 'package:chatapp/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
                    SizedBox(height: 60),
                    Center(
                      child: const Text(
                        'Signup',
                        style: TextStyle(
                          fontSize: 37.5,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 45,
                    ),
                    Container(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        'Email',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      validator: (data) {
                        if (data!.isEmpty) {
                          return 'field is required';
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
                      padding: const EdgeInsets.only(left: 15),
                      child: const Text(
                        'Password',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      validator: (data) {
                        if (data!.isEmpty) {
                          return 'field is required';
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
                        hintText: 'Create a strong password',
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
                  ],
                ),
                SizedBox(height: 40),
                Center(
                  child: GestureDetector(
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        isLodaing = true;
                        setState(() {});
                        try {
                          await registeruser();
                          Navigator.pushNamed(context, 'basma');
                        } on FirebaseAuthException catch (ex) {
                          if (ex.code == 'weak-password') {
                            ssb(context, 'The password is too weak');
                          } else if (ex.code == 'email-already-in-use') {
                            ssb(context,
                                'This email is already taken for another account');
                          }
                      
                        } catch (ex) {
                          ssb(context, 'There was an error');
                        }
                        isLodaing = false;
                        setState(() {});
                      } else {}
                    },
                    child: CustomButtonAuth(
                      title: 'Signup',
                    ),
                  ),
                ),
                SizedBox(height: 90),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Have An Account? ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: grey,
                          fontSize: 16.5,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed("login");
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: lightgreen,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.5,
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
