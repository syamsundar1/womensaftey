// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:women_safety/screens/loginpage.dart';

 void main()async{
  // var client = HttpClient();
  // client.openUrl("post", Uri.parse("http://5640-103-163-59-18.ngrok.io/user/login"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Women safety',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const LoginPage();
  }
}