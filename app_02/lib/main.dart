import 'package:flutter/material.dart';
import 'MyAppBar.dart';
import 'MyText.dart';
import 'MyContainer.dart';
import 'MyColummAndRow.dart';
import 'MyButton.dart';
import 'MyButton2.dart';
import 'MyButton3.dart';
import 'MyGestures.dart';
import 'MyTextField.dart';
import 'MyTextField2.dart';



void main() {
  runApp(const Directionality(
    textDirection: TextDirection.ltr,
    child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MyTextField2(),
    );
  }
}


