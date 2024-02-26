import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String mensagem) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Center(
        child: Text(
          '$mensagem',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.black12,
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50)),
        side: BorderSide(color: Colors.white),
      ),
    ),
  );
}