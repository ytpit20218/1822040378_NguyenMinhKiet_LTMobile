import 'package:flutter/material.dart';
import 'package:bt2/userMS/view/NoteListScreen.dart'; // Đường dẫn đến NoteListScreen
import 'package:bt2/userMS/db/NoteDatabaseHelper.dart'; // Đường dẫn đến NoteDatabaseHelper
import 'package:bt2/userMS/model/Note.dart'; // Đường dẫn đến lớp Note

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // Đảm bảo các bindings được khởi tạo trước
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
      home: NoteListScreen(), // Màn hình đầu tiên là NoteListScreen
    );
  }
}
