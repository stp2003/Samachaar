import 'package:flutter/material.dart';

Widget appBar() {
  return const Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Text(
        'Sama',
        style: TextStyle(
          color: Colors.white,
          fontSize: 23.0,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
        ),
      ),
      SizedBox(width: 2.0),
      Text(
        'Chaar',
        style: TextStyle(
          color: Colors.orange,
          fontSize: 23.0,
          letterSpacing: 1.2,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  );
}
