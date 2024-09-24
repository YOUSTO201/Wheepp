import 'package:chatapp/components/app_colors.dart';
import 'package:chatapp/generated/l10n.dart';
import 'package:chatapp/helper/ssb.dart';
import 'package:chatapp/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  bool isButtonActive = true;
  late TextEditingController controller;
  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    controller.addListener(() {
      final isButtonActive = controller.text.isNotEmpty;
      setState(() => this.isButtonActive = isButtonActive);
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  String? email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundcolor,
      body: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  right: isArabic() ? 0 : 300,
                  left: isArabic() ? 300 : 0,
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 27.5,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: isArabic() ? 70:50,
                  right: isArabic() ? 0 : 85,
                  left: isArabic() ? 100 : 0,
                ),
                child: Text(
                  S.of(context).ForgotPassword,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 65),
              Padding(
                padding: EdgeInsets.only(
                  right: isArabic() ? 15 : 70,
                  left: isArabic() ? 15 : 15,
                ),
                child: Text(
                  S.of(context).ResetPassword,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 100),
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: TextFormField(
                  controller: controller,
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
                      borderSide: BorderSide(color: lightgreen),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50),
              GestureDetector(
                onTap: () async {
                  if (email != '') {
                    try {
                      await FirebaseAuth.instance
                          .sendPasswordResetEmail(email: "$email");
                      ssj(context, S.of(context).TheLinkIsSentSuccessfully);
                      Navigator.of(context).pushNamed("login");
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'invalid-email') {
                        ssb(context,
                            S.of(context).PleaseEnterYourEmailAddress);
                      } else if (e.code == 'user-not-found') {
                        ssb(context, S.of(context).WrongCredentials);
                      } else if (e.code == 'too-many-requests') {
                        ssb(context, S.of(context).TooManyRequest);
                      } else {
                        ssb(context,
                            S.of(context).PleaseEnterYourEmailAddress);
                      }
                    } catch (e) {
                      ssb(context, S.of(context).Error);
                    }
                    setState(() {});
                  } else {
                    ssb(context, S.of(context).PleaseEnterYourEmailAddress);
                  }
                },
                child: Container(
                  height: 60,
                  width: 160,
                  decoration: BoxDecoration(
                    color: email != null && email != ''
                        ? Color.fromARGB(255, 5, 162, 125)
                        : const Color.fromARGB(255, 141, 211, 191),
                    borderRadius: BorderRadius.circular(17.5),
                  ),
                  child: Center(
                    child: Text(
                      S.of(context).SendResetPassword,
                      style: TextStyle(
                        color: email != null && email != ''
                            ? Colors.white
                            : Color.fromARGB(255, 91, 165, 149),
                        fontFamily: 'Rubik',
                        fontSize: 27.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}