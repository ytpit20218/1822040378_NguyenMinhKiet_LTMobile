// This is a basic Flutter widget test.
import 'package:bt1/b1/userMS_API_v2/view/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:bt1/b1/userMS_API_v2/view/UserListScreen.dart';




void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: LoginScreen()
    );
  }
}
