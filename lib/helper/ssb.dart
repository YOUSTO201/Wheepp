import 'package:chatapp/components/app_colors.dart';
import 'package:flutter/material.dart';

void ssb(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      dismissDirection: DismissDirection.down,
      backgroundColor: Colors.red,
      content: Text(
        message,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18.5,
          fontWeight: FontWeight.w400,
        ),
      ),
    ),
  );
}

void ssj(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      dismissDirection: DismissDirection.down,
      backgroundColor: lightgreen,
      content: Text(
        message,
        style: TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );
}
