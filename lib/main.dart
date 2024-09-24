import 'package:chatapp/Localeprovider.dart';
import 'package:chatapp/auth/login.dart';
import 'package:chatapp/auth/signup.dart';
import 'package:chatapp/chatpage.dart';
import 'package:chatapp/components/app_colors.dart';
import 'package:chatapp/firebase_options.dart';
import 'package:chatapp/forgtopassword.dart';
import 'package:chatapp/generated/l10n.dart';
import 'package:chatapp/languageinto.dart';
import 'package:chatapp/los.dart';
import 'package:chatapp/slang.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LocaleProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LocaleProvider>(
      builder: (context, localeProvider, child) {
        return MaterialApp(
          locale: localeProvider.locale,
          localizationsDelegates: [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          debugShowCheckedModeBanner: false,
          home: (FirebaseAuth.instance.currentUser != null &&
                  FirebaseAuth.instance.currentUser!.emailVerified)
              ? ChatPage()
              : Slang(),
          routes: {
            "resetPassword": (context) => ResetPassword(),
            "languageInto": (context) => LanguageInto(),
            "chatPage": (context) => ChatPage(),
            "los": (context) => Los(),
            "slang": (context) => Slang(),
            "signup": (context) => SignUp(),
            "login": (context) => Login(),
          },
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: lightgreen),
            useMaterial3: true,
          ),
        );
      },
    );
  }
}

bool isArabic() {
  return Intl.getCurrentLocale() == 'ar';
}