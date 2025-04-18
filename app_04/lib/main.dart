import 'package:app_04/userMS/view/UserListScreen.dart';
import 'package:flutter/material.dart';
import 'package:app_04/my_widget_02_form//f1_form_basics.dart';
import 'my_widget_02_form//f2_form_TextFormField.dart';
import 'my_widget_02_form//f2_form_CheckBox.dart';
import 'my_widget_02_form//f4_form_Date.dart';
import 'my_widget_02_form//f5_form_ScrollView.dart';
import 'my_widget_02_form//f6_form_ImagePicker.dart';
import 'package:flutter/material.dart';
import 'package:app_04/userMS/db/UserDatabaseHelper.dart';

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
      home: UserListScreen()
    );
  }
}
