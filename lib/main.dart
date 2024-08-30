import 'package:chatapp/ara.dart';
import 'package:chatapp/arab.dart';
import 'package:chatapp/auth/login.dart';
import 'package:chatapp/auth/signup.dart';
import 'package:chatapp/basma.dart';
import 'package:chatapp/chatpage.dart';
import 'package:chatapp/components/app_colors.dart';
// import 'package:chatapp/components/shimmer.dart';
import 'package:chatapp/firebase_options.dart';
import 'package:chatapp/forpass.dart';
import 'package:chatapp/homepage.dart';
import 'package:chatapp/homescreen.dart';
import 'package:chatapp/los.dart';
import 'package:chatapp/slang.dart';
import 'package:chatapp/splash.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:FirebaseAuth.instance.currentUser == null ? Splahs() : Basma(),
      routes: {
        "basma": (context) => Basma(),
        "homescreen": (context) => Homescreen(),
        "forpass": (context) => Forpass(),
        "chatPage": (context) => ChatPage(),
        "arab": (context) => Arab(),
        "ara": (context) => Ara(),
        "los": (context) => Los(),
        "splahs": (context) => Splahs(),
        "slang": (context) => Slang(),
        "signup": (context) => SignUp(),
        "login": (context) => Login(),
        "homepage": (context) => Homapage(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: lightgreen),
        useMaterial3: true,
      ),
    );
  }
}
