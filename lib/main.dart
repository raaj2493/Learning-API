// ignore_for_file: unused_import

import 'package:apilearn/GET/APIs/postapi.dart';
import 'package:apilearn/GET/APIs/userapi.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Userapi(),
    );
  }
}
