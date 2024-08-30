import 'package:chatapp/components/app_colors.dart';
import 'package:flutter/material.dart';

class Forpass extends StatelessWidget {
  const Forpass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundcolor,
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 100),
          child: Column(
            children: [
              Text(
                'Please enter your Email to make a new Password',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
              SizedBox(height: 100),
              TextFormField(
                decoration: InputDecoration(
                  hintStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[400],
                  ),
                  hintText: 'Enter your Email',
                  // hintText: 'username@example.com',
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
              SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  "verify",
                  style: TextStyle(fontSize: 25),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
