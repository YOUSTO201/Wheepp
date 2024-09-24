import 'package:chatapp/components/app_colors.dart';
import 'package:chatapp/components/chat_buble.dart';
import 'package:chatapp/components/constns.dart';
import 'package:chatapp/generated/l10n.dart';
import 'package:chatapp/helper/ssb.dart';
import 'package:chatapp/main.dart';
import 'package:chatapp/models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:lottie/lottie.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ChatPage extends StatelessWidget {
  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessagesCollections);

  TextEditingController controller = TextEditingController();

  final _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    final LocalAuthentication auth = LocalAuthentication();

    chechAuthenticationLogout() async {
      bool isAvailable = await auth.canCheckBiometrics;

      if (isAvailable) {
        bool? result = await auth.authenticate(
          localizedReason: S.of(context).VarifyToLogout,
        );
        if (result) {
          await FirebaseAuth.instance.signOut();
          Navigator.of(context)
              .pushNamedAndRemoveUntil("login", (routs) => false);
          ssj(context, S.of(context).LogoutSucceed);
        }
      }
    }

    chechAuthenticationDel() async {
      bool isAvailable = await auth.canCheckBiometrics;

      if (isAvailable) {
        bool? result = await auth.authenticate(
          localizedReason: S.of(context).VarifyToDeleteTheAccount,
        );
        if (result) {
          final user = FirebaseAuth.instance.currentUser;
          await user?.delete();
          Navigator.of(context)
              .pushNamedAndRemoveUntil("login", (routs) => false);
          ssj(context, S.of(context).DeletedSucceed);
        }
      }
    }

    var email = ModalRoute.of(context)!.settings.arguments;

    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy(kCreatedAt, descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Message> messagesList = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            messagesList.add(
              Message.fromJson(snapshot.data!.docs[i]),
            );
          }

          return Scaffold(
            backgroundColor: Color(0xff0c0d0f),
            appBar: AppBar(
              shadowColor: Colors.black,
              automaticallyImplyLeading: false,
              backgroundColor: backgroundcolor,
              actions: [
                Icon(
                  Icons.videocam_outlined,
                  color: email == null ? backgroundcolor : Colors.white,
                  size: 30,
                ),
                SizedBox(width: 30),
                Icon(
                  Icons.phone_outlined,
                  color: email == null ? backgroundcolor : Colors.white,
                  size: 26,
                ),
                SizedBox(width: 10),
                PopupMenuButton(
                  onSelected: (value) {
                    ssb(context, S.of(context).TapInWordsAndIcons);
                  },
                  shadowColor: Colors.black,
                  color: backgroundcolor,
                  iconColor: Colors.white,
                  iconSize: 27,
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 'val1',
                      child: TextButton.icon(
                        onPressed: () {
                          ssb(context, S.of(context).PrivateEmailAccount);
                        },
                        label: email == null
                            ? Text(
                                S
                                    .of(context)
                                    .SorryButYouMustLogoutAndLoginAgain,
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 15,
                                  fontFamily: 'Rubik',
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            : Text(
                                '$email',
                                style: TextStyle(
                                  color: messagecolor,
                                  fontSize: 15,
                                  fontFamily: 'Rubik',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                        icon: Icon(
                          Icons.email,
                          color: email == null ? Colors.red : messagecolor,
                          size: 25,
                        ),
                      ),
                    ),
                    PopupMenuItem(
                      value: 'val2',
                      child: TextButton.icon(
                        onPressed: () async {
                          email == null
                              ? ssb(context, S.of(context).CannotDelete)
                              : showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    actions: [
                                      TextButton(
                                        onPressed: () async {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text(
                                          S.of(context).Close,
                                          style: TextStyle(
                                            color: Colors.green,
                                            fontSize: isArabic() ? 18.5 : 16,
                                          ),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () async {
                                          chechAuthenticationDel();
                                        },
                                        child: Text(
                                          S.of(context).Yes,
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ],
                                    backgroundColor: backgroundcolor,
                                    title: Text(
                                      S.of(context).ShowDiaologDeleteAccount,
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
                        },
                        label: Text(
                          S.of(context).DeleteAccount,
                          style: TextStyle(
                            color: messagecolor,
                            fontSize: 17,
                            fontFamily: 'Rubik',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        icon: Icon(
                          Icons.delete,
                          color: messagecolor,
                          size: 25,
                        ),
                      ),
                    ),
                    PopupMenuItem(
                      value: 'val3',
                      child: TextButton.icon(
                        onPressed: () {
                          Navigator.pushNamed(context, 'languageInto');
                        },
                        label: Text(
                          S.of(context).Language,
                          style: TextStyle(
                            color: messagecolor,
                            fontSize: 17,
                            fontFamily: 'Rubik',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        icon: Icon(
                          Icons.language,
                          color: messagecolor,
                          size: 25,
                        ),
                      ),
                    ),
                    PopupMenuItem(
                      value: 'val4',
                      child: TextButton.icon(
                        onPressed: () async {
                          email == null
                              ? await signout(context)
                              : chechAuthenticationLogout();
                        },
                        label: Text(
                          S.of(context).Logout,
                          style: TextStyle(
                            color: messagecolor,
                            fontSize: 17,
                            fontFamily: 'Rubik',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        icon: Icon(
                          Icons.logout,
                          color: messagecolor,
                          size: 25,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
              title: Row(
                children: [
                  email == null
                      ? Text('')
                      : CircleAvatar(
                          child: Image.asset(
                            'images/youana.png',
                            height: 200,
                            width: 200,
                          ),
                        ),
                  SizedBox(width: 15),
                  Text(
                    'Yousto',
                    style: TextStyle(
                      color: email == null ? backgroundcolor : Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/a5ir.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  email == null
                      ? Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 100),
                              child: Lottie.asset(
                                "assets/animation.json",
                                width: 500,
                                height: 175,
                                fit: BoxFit.contain,
                              ),
                            ),
                            SizedBox(height: 25),
                            Padding(
                              padding: EdgeInsets.only(right: 30, left: 30),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: darkgreen,
                                ),
                                height: 100,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    right: 20,
                                    left: 20,
                                  ),
                                  child: Center(
                                    child: Text(
                                      S
                                          .of(context)
                                          .SorryButYouMustLogoutAndLoginAgain,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Rubik',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: darkgreen,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: TextButton.icon(
                                    onPressed: () async {
                                      await signout(context);
                                      ssj(context,
                                          S.of(context).LogoutSucceed);
                                    },
                                    label: Text(
                                      S.of(context).Logout,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Rubik',
                                      ),
                                    ),
                                    icon: Icon(
                                      Icons.logout,
                                      color: Colors.white,
                                      size: 27.5,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                      : Expanded(
                          child: ListView.builder(
                            reverse: true,
                            controller: _controller,
                            itemCount: messagesList.length,
                            itemBuilder: (context, index) {
                              return messagesList[index].id == email
                                  ? ChatBuble(
                                      message: messagesList[index],
                                    )
                                  : ChatBubleForFriend(
                                      message: messagesList[index],
                                    );
                            },
                          ),
                        ),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: 5,
                      right: 15,
                      left: 15,
                      top: 4.5,
                    ),
                    child: email == null
                        ? null
                        : TextField(
                            controller: controller,
                            onSubmitted: (data) {
                              messages.add({
                                kMessage: data,
                                kCreatedAt: DateTime.now(),
                                'id': email
                              });
                              controller.clear();
                              _controller.jumpTo(0);
                            },
                            cursorColor: lightgreen,
                            cursorOpacityAnimates: true,
                            cursorRadius: Radius.circular(50),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.emoji_emotions_outlined,
                                color: emojicolor,
                                size: 27.5,
                              ),
                              hintStyle: TextStyle(
                                fontSize: 18,
                                color: emojicolor,
                              ),
                              hintText: S.of(context).Message,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  Icons.send_rounded,
                                  color: lightgreen,
                                  size: 30,
                                ),
                                onPressed: () {},
                              ),
                              filled: true,
                              fillColor: Color(0xff1f2c34),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18.5),
                                borderSide: BorderSide(color: messageFriend),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18.5),
                                borderSide: BorderSide(color: messageFriend),
                              ),
                              enabledBorder: OutlineInputBorder(
                                gapPadding: 200,
                                borderRadius: BorderRadius.circular(18.5),
                                borderSide: BorderSide(
                                  color: messageFriend,
                                ),
                              ),
                            ),
                          ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return ModalProgressHUD(
            color: backgroundcolor,
            child: Scaffold(
              backgroundColor: backgroundcolor,
            ),
            inAsyncCall: true,
          );
        }
      },
    );
  }

  Future<void> signout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushNamedAndRemoveUntil("login", (routs) => false);
  }
}
