import 'package:chatapp/components/app_colors.dart';
import 'package:chatapp/components/chat_buble.dart';
import 'package:chatapp/components/constns.dart';
import 'package:chatapp/models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ChatPage extends StatelessWidget {
  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessagesCollections);
  TextEditingController controller = TextEditingController();
  final _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    final LocalAuthentication auth = LocalAuthentication();

    chechAuthentication() async {
      bool isAvailable;

      isAvailable = await auth.canCheckBiometrics;

      if (isAvailable) {
        bool result = await auth.authenticate(
          localizedReason: 'Varify the identity is required to Signout',
        );
        if (result) {
          await FirebaseAuth.instance.signOut();
          Navigator.of(context)
              .pushNamedAndRemoveUntil("login", (routs) => false);
        } else {}
      } else {}
    }

    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy(kCreatedAt, descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Message> messagesList = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            messagesList.add(
              Message.fromJson(snapshot.data!.docs[i]),
            );

            //   List<Message> createdAt = [];
            //   for (int i = 0; i < snapshot.data!.docs.length; i++) {
            //     createdAt.add(
            //       Message.fromJson(snapshot.data!.docs[i]),
            //     );
            //   }
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
                  color: Colors.white,
                  size: 30,
                ),
                SizedBox(width: 20),
                Icon(
                  Icons.phone_outlined,
                  color: Colors.white,
                  size: 26,
                ),
                SizedBox(width: 15),
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
                            onPressed: () {
                              chechAuthentication();
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
                    size: 26,
                  ),
                ),
                SizedBox(width: 5),
              ],
              title: Row(
                children: [
                  CircleAvatar(
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
                      color: Colors.white,
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
                  Expanded(
                    child: ListView.builder(
                      reverse: true,
                      controller: _controller,
                      itemCount: messagesList.length,
                      itemBuilder: (context, index) {
                        // return ChatBuble(message: messagesList[index]);
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
                    padding: const EdgeInsets.only(
                      bottom: 5,
                      right: 15,
                      left: 15,
                      top: 4.5,
                    ),
                    child: TextField(
                      controller: controller,
                      onSubmitted: (data) {
                        messages.add({
                          kMessage: data,
                          kCreatedAt: DateTime.now(),
                          'id': email
                        });
                        controller.clear();
                        _controller.jumpTo(0);
                        // _controller.animateTo(
                        //   0,
                        //   duration: Duration(milliseconds: 5),
                        //   curve: Curves.easeIn,
                        // );
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
                        hintText: 'Message',
                        suffixIcon: Icon(
                          Icons.send_rounded,
                          color: lightgreen,
                          size: 30,
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
}
