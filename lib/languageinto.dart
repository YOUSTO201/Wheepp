import 'package:chatapp/components/app_colors.dart';
import 'package:chatapp/generated/l10n.dart';
import 'package:chatapp/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Localeprovider.dart';

class LanguageInto extends StatefulWidget {
  const LanguageInto({super.key});

  @override
  State<LanguageInto> createState() => _SlangState();
}

class _SlangState extends State<LanguageInto> {
  String? language = 'English';

  @override
  void initState() {
    super.initState();
    _loadSavedLanguage();
  }

  void _loadSavedLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedLanguage = prefs.getString('language');
    if (savedLanguage != null) {
      setState(() {
        language = savedLanguage;
      });
      final localeProvider =
          Provider.of<LocaleProvider>(context, listen: false);
      localeProvider
          .setLocale(savedLanguage == 'English' ? Locale('en') : Locale('ar'));
    }
  }

  void _saveLanguage(String langCode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', langCode);
  }

  @override
  Widget build(BuildContext context) {
    final localeProvider = Provider.of<LocaleProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: backgroundcolor,
      body: Column(
        children: [
          SizedBox(height: isArabic() ? 120 : 135),
          Text(
            S.of(context).ChangeLanguage,
            style: TextStyle(
              color: Colors.white,
              fontSize: isArabic() ? 35 : 27.5,
              fontFamily: 'Rubik',
              fontWeight: isArabic() ? null : FontWeight.w600,
            ),
          ),
          SizedBox(height: isArabic() ? 20 : 25),
          Padding(
            padding: EdgeInsets.only(left: isArabic() ? 0 : 7.5),
            child: Text(
              S.of(context).ChooseNewLanguage,
              style: TextStyle(
                color: Colors.white,
                fontSize: isArabic() ? 22.5 : 17.8,
                fontFamily: 'Rubik',
                fontWeight: isArabic() ? null : FontWeight.w600,
              ),
            ),
          ),
          SizedBox(height: 105),
          RadioListTile(
            subtitle: Text(
              S.of(context).mainlanguage,
              style: TextStyle(
                color: grey,
                fontSize: 15,
              ),
            ),
            selectedTileColor: backgroundcolor,
            activeColor: lightgreen,
            title: Text(
              S.of(context).English,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            value: 'English',
            groupValue: language,
            onChanged: (val) {
              localeProvider.setLocale(Locale('en'));
              _saveLanguage('English');
              setState(() {
                language = val;
              });
            },
          ),
          SizedBox(height: 12.5),
          GestureDetector(
            onTap: () {},
            child: RadioListTile(
              subtitle: Text(
                'Arabic',
                style: TextStyle(
                  color: grey,
                  fontSize: 15,
                ),
              ),
              selectedTileColor: backgroundcolor,
              activeColor: lightgreen,
              title: Text(
                'العربية',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              value: 'Arabic',
              groupValue: language,
              onChanged: (val) {
                localeProvider.setLocale(Locale('ar'));
                _saveLanguage('Arabic');
                setState(() {
                  language = val;
                });
              },
            ),
          ),
          SizedBox(height: 150),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                    height: 50,
                    width: 160,
                    decoration: BoxDecoration(
                      color: lightgreen,
                      borderRadius: BorderRadius.circular(35),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          offset: Offset(2, 2),
                          blurRadius: 15,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        S.of(context).Save,
                        style: TextStyle(
                          color: backgroundcolor,
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Rubik',
                        ),
                      ),
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}