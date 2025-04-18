import 'package:flutter/material.dart';
import 'package:bt2/userMS/view/NoteListScreen.dart'; // Đường dẫn đến NoteListScreen
import 'package:bt2/userMS/db/NoteDatabaseHelper.dart'; // Đường dẫn đến NoteDatabaseHelper
import 'package:bt2/userMS/model/Note.dart'; // Đường dẫn đến lớp Note
import 'package:bt2/userMS/view/LoginScreen.dart'; // Đường dẫn đến LoginScreen
import 'package:firebase_core/firebase_core.dart'; // Đường dẫn đến Firebase

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // Đảm bảo các bindings được khởi tạo trước
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Ẩn "debug banner"
      title: 'Ứng dụng Ghi chú',
      theme: ThemeData(
        primarySwatch: Colors.blue, // Màu chính của ứng dụng
        visualDensity: VisualDensity.adaptivePlatformDensity, // Đảm bảo giao diện thích ứng
      ),
      home: LoginScreen(), // Màn hình đầu tiên là NoteListScreen
    );
  }
}
